import 'dart:async';
import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/command.dart';
import '../domain/commands/result.dart';

class ConstantModeViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  ConstantModeSettings _settings = const ConstantModeSettings();
  DeviceStatus _status = const DeviceStatus();

  bool _timerEnabled = false;
  Duration _elapsedTime = Duration.zero;
  Timer? _timer;

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

  bool get timerEnabled => _timerEnabled;
  Duration get elapsedTime => _elapsedTime;

  void setTimerEnabled(bool enabled) {
    if (_timerEnabled == enabled) return;
    _timerEnabled = enabled;
    if (_timerEnabled) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedTime += const Duration(seconds: 1);
        notifyListeners();
      });
    } else {
      _timer?.cancel();
      _timer = null;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ConstantModeSettings get settings => _settings;
  DeviceStatus get status => _status;

  void updateSettings(ConstantModeSettings newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  Future<Result<void>> start() async {
    _elapsedTime = Duration.zero;
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
