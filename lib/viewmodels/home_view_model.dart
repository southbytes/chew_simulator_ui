import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/command.dart';
import '../domain/commands/result.dart';

class HomeViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  DeviceStatus _status = const DeviceStatus();

  late final Command1<void, ThermocycleSettings> startCommand;
  late final Command0<void> pauseCommand;
  late final Command0<void> resumeCommand;
  late final Command0<void> stopCommand;

  HomeViewModel(this._repository) {
    startCommand = Command1(_repository.startThermocycle);
    pauseCommand = Command0(_repository.pause);
    resumeCommand = Command0(_repository.resume);
    stopCommand = Command0(_repository.stop);

    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  DeviceStatus get status => _status;

  Future<Result<void>> start() async {
    // Do not start thermocycling if device is already in use or in constant mode
    if (_status.state == DeviceState.running ||
        _status.mode == OperationMode.constant) {
      return const Result.ok(null);
    }

    _status = _status.copyWith(
      state: DeviceState.running,
      mode: OperationMode.thermocycle,
    );
    notifyListeners();

    await startCommand.execute(const ThermocycleSettings());
    final result = startCommand.result!;
    switch (result) {
      case Ok():
        notifyListeners();
        return result;
      case Error():
        _status = _repository.currentStatus;
        notifyListeners();
        return result;
    }
  }

  Future<Result<void>?> pauseResume() async {
    if (_status.state == DeviceState.running) {
      _status = _status.copyWith(state: DeviceState.paused);
      notifyListeners();

      await pauseCommand.execute();
      final result = pauseCommand.result!;
      switch (result) {
        case Ok():
          notifyListeners();
          return result;
        case Error():
          _status = _repository.currentStatus;
          notifyListeners();
          return result;
      }
    } else if (_status.state == DeviceState.paused) {
      _status = _status.copyWith(state: DeviceState.running);
      notifyListeners();

      await resumeCommand.execute();
      final result = resumeCommand.result!;
      switch (result) {
        case Ok():
          notifyListeners();
          return result;
        case Error():
          _status = _repository.currentStatus;
          notifyListeners();
          return result;
      }
    }
    return null;
  }

  Future<Result<void>> stop() async {
    _status = _status.copyWith(
      state: DeviceState.ready,
      mode: OperationMode.idle,
    );
    notifyListeners();

    await stopCommand.execute();
    final result = stopCommand.result!;
    switch (result) {
      case Ok():
        notifyListeners();
        return result;
      case Error():
        _status = _repository.currentStatus;
        notifyListeners();
        return result;
    }
  }
}
