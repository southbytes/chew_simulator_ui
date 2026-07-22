import '../../domain/commands/result.dart';
import '../../domain/models/models.dart';

abstract class DeviceRepository {
  Stream<DeviceStatus> get statusStream;
  DeviceStatus get currentStatus;

  Future<Result<void>> startThermocycle(ThermocycleSettings settings);
  Future<Result<void>> startConstantMode(ConstantModeSettings settings);
  Future<Result<void>> pause();
  Future<Result<void>> resume();
  Future<Result<void>> stop();
  Future<Result<void>> emergencyStop();

  Future<Result<void>> saveSettings(ThermocycleSettings settings);
  Future<Result<ThermocycleSettings>> loadSettings();

  // Actuator write methods
  Future<Result<void>> setPump1Pulse(int pulse);
  Future<Result<void>> setPump2Pulse(int pulse);
  Future<Result<void>> setHotFillValve(bool open);
  Future<Result<void>> setHotDrainValve(bool open);
  Future<Result<void>> setColdFillValve(bool open);
  Future<Result<void>> setColdDrainValve(bool open);
  Future<Result<void>> resetHitCount();
}
