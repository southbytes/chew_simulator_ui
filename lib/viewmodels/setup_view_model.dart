import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/commands.dart';

class SetupViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  ThermocycleSettings _settings = const ThermocycleSettings();

  SetupViewModel(this._repository) {
    _loadSettings();
  }

  ThermocycleSettings get settings => _settings;

  void _loadSettings() async {
    _settings = await _repository.loadSettings();
    notifyListeners();
  }

  void updateSettings(ThermocycleSettings newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  void save() {
    SaveSettingsCommand(_repository, _settings).execute();
  }

  void start() {
    StartThermocycleCommand(_repository, _settings).execute();
  }

  void resetToDefault() {
    _settings = const ThermocycleSettings();
    notifyListeners();
  }
}
