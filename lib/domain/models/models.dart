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
    final cycleTime =
        dwellTimeSeconds * 2 +
        transferTimeSeconds * 2 +
        drainingTimeSeconds * 2;
    return Duration(seconds: cycleTime * targetCycles);
  }
}

@freezed
abstract class ConstantModeSettings with _$ConstantModeSettings {
  const factory ConstantModeSettings({
    @Default(37.0) double targetTemp,
    @Default(true) bool isInfinite,
    @Default(Duration(hours: 24)) Duration duration,
  }) = _ConstantModeSettings;

  factory ConstantModeSettings.fromJson(Map<String, dynamic> json) =>
      _$ConstantModeSettingsFromJson(json);

  const ConstantModeSettings._();
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
    @Default(0) int currentCycle,
    @Default(Duration.zero) Duration remainingTime,
    @Default(0.0) double progress, // 0.0 to 1.0
  }) = _DeviceStatus;

  const DeviceStatus._();
}
