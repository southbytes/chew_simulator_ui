import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class ThermocycleSettings with _$ThermocycleSettings {
  const factory ThermocycleSettings({
    @Default(5.0) double coldBathTemp,
    @Default(55.0) double hotBathTemp,
    @Default(2.0) double temperatureTolerance,
    @Default(30) int dwellTimeSeconds,
    @Default(10) int transferTimeSeconds,
    @Default(0) int drainingTimeSeconds,
    @Default(1000) int targetCycles,
  }) = _ThermocycleSettings;

  factory ThermocycleSettings.fromJson(Map<String, dynamic> json) =>
      _$ThermocycleSettingsFromJson(json);

  const ThermocycleSettings._();

  Duration get estimatedDuration {
    final cycleTime = dwellTimeSeconds * 2 + transferTimeSeconds * 2 + drainingTimeSeconds * 2;
    return Duration(seconds: cycleTime * targetCycles);
  }
}

@freezed
abstract class ConstantModeSettings with _$ConstantModeSettings {
  const factory ConstantModeSettings({
    @Default(37.0) double targetTemp,
    @Default(true) bool isInfinite,
    @Default(Duration(hours: 0)) Duration duration,
  }) = _ConstantModeSettings;

  factory ConstantModeSettings.fromJson(Map<String, dynamic> json) =>
      _$ConstantModeSettingsFromJson(json);

  const ConstantModeSettings._();
}

// Sensor
enum SensorStatus { offline, online, warning, alarm, normal, faulty, overlimit }
enum SensorType { temperature, pressure, level, flow, digital }

@freezed
abstract class Sensor with _$Sensor {
  const factory Sensor({
    required String id,
    required String name,
    required SensorType type,

    String? unit,

    @Default(SensorStatus.normal) SensorStatus status,

    SensorValue? value,

    DateTime? lastUpdated,
  }) = _Sensor;

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class SensorValue with _$SensorValue {
  const factory SensorValue.doubleValue(double value) = DoubleValue;
  const factory SensorValue.intValue(int value) = IntValue;
  const factory SensorValue.boolValue(bool value) = BoolValue;
  const factory SensorValue.textValue(String value) = TextValue;

  factory SensorValue.fromJson(Map<String, dynamic> json) => _$SensorValueFromJson(json);
}

enum DeviceState { ready, running, paused, error }

enum OperationMode { thermocycle, constant, idle }

@freezed
abstract class DeviceStatus with _$DeviceStatus {
  const factory DeviceStatus({
    @Default(DeviceState.ready) DeviceState state,
    @Default(OperationMode.idle) OperationMode mode,
    @Default(0.0) double currentColdBathTemp,
    @Default(0.0) double currentHotBathTemp,
    @Default(0.0) double currentChamberTemp,
    @Default(
      Sensor(id: 'chamber1_temp', name: 'Chamber 1 Temperature', type: SensorType.temperature, value: const SensorValue.doubleValue(0.0)),
    )
    Sensor temp1Sensor,
    // @Default(0.0) double currentChamber1Temp,
    @Default(0.0) double currentChamber2Temp,
    @Default(0.0) double currentChamber3Temp,
    @Default(0.0) double currentChamber4Temp,
    @Default(0) int currentCycle,
    @Default(Duration.zero) Duration remainingTime,
    @Default(0.0) double progress, // 0.0 to 1.0
    @Default(false) bool watchdogStatus,
    @Default(0.0) double levelSensor,
    @Default(0) int hitCount,
    @Default(0) int p1Pulse,
    @Default(0) int p2Pulse,
    @Default(false) bool hotFillValve,
    @Default(false) bool hotDrainValve,
    @Default(false) bool coldFillValve,
    @Default(false) bool coldDrainValve,
  }) = _DeviceStatus;

  const DeviceStatus._();
}
