import '../../domain/models/models.dart';

abstract class DeviceRepository {
  Stream<DeviceStatus> get statusStream;
  DeviceStatus get currentStatus;

  Future<void> startThermocycle(ThermocycleSettings settings);
  Future<void> startConstantMode(ConstantModeSettings settings);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
  Future<void> emergencyStop();

  Future<void> saveSettings(ThermocycleSettings settings);
  Future<ThermocycleSettings> loadSettings();
}
