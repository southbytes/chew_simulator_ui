import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/commands.dart';

class ConstantModeViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  ConstantModeSettings _settings = const ConstantModeSettings();
  DeviceStatus _status = const DeviceStatus();

  ConstantModeViewModel(this._repository) {
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

  void start() {
    StartConstantModeCommand(_repository, _settings).execute();
  }

  void stop() {
    StopCommand(_repository).execute();
  }
}
