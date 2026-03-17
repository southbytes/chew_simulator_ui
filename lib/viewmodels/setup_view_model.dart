import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/command.dart';
import '../domain/commands/result.dart';

class SetupViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  ThermocycleSettings _settings = const ThermocycleSettings();

  late final Command0<ThermocycleSettings> loadSettingsCommand;
  late final Command1<void, ThermocycleSettings> saveSettingsCommand;
  late final Command1<void, ThermocycleSettings> startCommand;

  SetupViewModel(this._repository) {
    loadSettingsCommand = Command0(_repository.loadSettings);
    saveSettingsCommand = Command1(_repository.saveSettings);
    startCommand = Command1(_repository.startThermocycle);
    _loadSettings();
  }

  ThermocycleSettings get settings => _settings;

  void _loadSettings() async {
    await loadSettingsCommand.execute();
    final result = loadSettingsCommand.result;
    if (result != null) {
      switch (result) {
        case Ok(value: final settings):
          _settings = settings;
          notifyListeners();
          break;
        case Error():
          break;
      }
    }
  }

  void updateSettings(ThermocycleSettings newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  Future<Result<void>> save() async {
    await saveSettingsCommand.execute(_settings);
    final result = saveSettingsCommand.result!;
    switch (result) {
      case Ok():
        notifyListeners();
        return result;
      case Error():
        notifyListeners();
        return result;
    }
  }

  Future<Result<void>> start() async {
    await startCommand.execute(_settings);
    final result = startCommand.result!;
    switch (result) {
      case Ok():
        notifyListeners();
        return result;
      case Error():
        notifyListeners();
        return result;
    }
  }

  void resetToDefault() {
    _settings = const ThermocycleSettings();
    notifyListeners();
  }
}
