import '../models/models.dart';
import '../../data/repositories/device_repository.dart';

abstract class Command {
  Future<void> execute();
}

class StartThermocycleCommand implements Command {
  final DeviceRepository repository;
  final ThermocycleSettings settings;

  StartThermocycleCommand(this.repository, this.settings);

  @override
  Future<void> execute() => repository.startThermocycle(settings);
}

class StartConstantModeCommand implements Command {
  final DeviceRepository repository;
  final ConstantModeSettings settings;

  StartConstantModeCommand(this.repository, this.settings);

  @override
  Future<void> execute() => repository.startConstantMode(settings);
}

class PauseCommand implements Command {
  final DeviceRepository repository;

  PauseCommand(this.repository);

  @override
  Future<void> execute() => repository.pause();
}

class ResumeCommand implements Command {
  final DeviceRepository repository;

  ResumeCommand(this.repository);

  @override
  Future<void> execute() => repository.resume();
}

class StopCommand implements Command {
  final DeviceRepository repository;

  StopCommand(this.repository);

  @override
  Future<void> execute() => repository.stop();
}

class EmergencyStopCommand implements Command {
  final DeviceRepository repository;

  EmergencyStopCommand(this.repository);

  @override
  Future<void> execute() => repository.emergencyStop();
}

class SaveSettingsCommand implements Command {
  final DeviceRepository repository;
  final ThermocycleSettings settings;

  SaveSettingsCommand(this.repository, this.settings);

  @override
  Future<void> execute() => repository.saveSettings(settings);
}
