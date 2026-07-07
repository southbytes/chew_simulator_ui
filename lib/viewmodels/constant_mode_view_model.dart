import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/command.dart';
import '../domain/commands/result.dart';

class ConstantModeViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  ConstantModeSettings _settings = const ConstantModeSettings();
  DeviceStatus _status = const DeviceStatus();

  late final Command1<void, ConstantModeSettings> startCommand;
  late final Command0<void> stopCommand;

  ConstantModeViewModel(this._repository) {
    startCommand = Command1(_repository.startConstantMode);
    stopCommand = Command0(_repository.stop);

    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  ConstantModeSettings get settings => _settings;
  DeviceStatus get status => _status;

  void updateSettings(ConstantModeSettings newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  Future<Result<void>> start() async {
    _status = _status.copyWith(
      state: DeviceState.running,
      mode: OperationMode.constant,
    );
    notifyListeners();

    await startCommand.execute(_settings);
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
