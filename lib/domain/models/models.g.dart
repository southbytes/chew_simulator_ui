// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThermocycleSettings _$ThermocycleSettingsFromJson(Map<String, dynamic> json) =>
    _ThermocycleSettings(
      coldBathTemp: (json['coldBathTemp'] as num?)?.toDouble() ?? 5.0,
      hotBathTemp: (json['hotBathTemp'] as num?)?.toDouble() ?? 55.0,
      temperatureTolerance:
          (json['temperatureTolerance'] as num?)?.toDouble() ?? 2.0,
      dwellTimeSeconds: (json['dwellTimeSeconds'] as num?)?.toInt() ?? 30,
      transferTimeSeconds: (json['transferTimeSeconds'] as num?)?.toInt() ?? 10,
      drainingTimeSeconds: (json['drainingTimeSeconds'] as num?)?.toInt() ?? 0,
      targetCycles: (json['targetCycles'] as num?)?.toInt() ?? 1000,
    );

Map<String, dynamic> _$ThermocycleSettingsToJson(
  _ThermocycleSettings instance,
) => <String, dynamic>{
  'coldBathTemp': instance.coldBathTemp,
  'hotBathTemp': instance.hotBathTemp,
  'temperatureTolerance': instance.temperatureTolerance,
  'dwellTimeSeconds': instance.dwellTimeSeconds,
  'transferTimeSeconds': instance.transferTimeSeconds,
  'drainingTimeSeconds': instance.drainingTimeSeconds,
  'targetCycles': instance.targetCycles,
};

_ConstantModeSettings _$ConstantModeSettingsFromJson(
  Map<String, dynamic> json,
) => _ConstantModeSettings(
  targetTemp: (json['targetTemp'] as num?)?.toDouble() ?? 37.0,
  isInfinite: json['isInfinite'] as bool? ?? true,
  duration: json['duration'] == null
      ? const Duration(hours: 24)
      : Duration(microseconds: (json['duration'] as num).toInt()),
);

Map<String, dynamic> _$ConstantModeSettingsToJson(
  _ConstantModeSettings instance,
) => <String, dynamic>{
  'targetTemp': instance.targetTemp,
  'isInfinite': instance.isInfinite,
  'duration': instance.duration.inMicroseconds,
};
