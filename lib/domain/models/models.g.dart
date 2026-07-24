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
      ? const Duration(hours: 0)
      : Duration(microseconds: (json['duration'] as num).toInt()),
);

Map<String, dynamic> _$ConstantModeSettingsToJson(
  _ConstantModeSettings instance,
) => <String, dynamic>{
  'targetTemp': instance.targetTemp,
  'isInfinite': instance.isInfinite,
  'duration': instance.duration.inMicroseconds,
};

_Sensor _$SensorFromJson(Map<String, dynamic> json) => _Sensor(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$SensorTypeEnumMap, json['type']),
  unit: json['unit'] as String?,
  status:
      $enumDecodeNullable(_$SensorStatusEnumMap, json['status']) ??
      SensorStatus.normal,
  value: json['value'] == null
      ? null
      : SensorValue.fromJson(json['value'] as Map<String, dynamic>),
  lastUpdated: json['lastUpdated'] == null
      ? null
      : DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$SensorToJson(_Sensor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$SensorTypeEnumMap[instance.type]!,
  'unit': instance.unit,
  'status': _$SensorStatusEnumMap[instance.status]!,
  'value': instance.value,
  'lastUpdated': instance.lastUpdated?.toIso8601String(),
};

const _$SensorTypeEnumMap = {
  SensorType.temperature: 'temperature',
  SensorType.pressure: 'pressure',
  SensorType.level: 'level',
  SensorType.flow: 'flow',
  SensorType.digital: 'digital',
};

const _$SensorStatusEnumMap = {
  SensorStatus.offline: 'offline',
  SensorStatus.online: 'online',
  SensorStatus.warning: 'warning',
  SensorStatus.alarm: 'alarm',
  SensorStatus.normal: 'normal',
  SensorStatus.faulty: 'faulty',
  SensorStatus.overlimit: 'overlimit',
};

DoubleValue _$DoubleValueFromJson(Map<String, dynamic> json) => DoubleValue(
  (json['value'] as num).toDouble(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$DoubleValueToJson(DoubleValue instance) =>
    <String, dynamic>{'value': instance.value, 'type': instance.$type};

IntValue _$IntValueFromJson(Map<String, dynamic> json) =>
    IntValue((json['value'] as num).toInt(), $type: json['type'] as String?);

Map<String, dynamic> _$IntValueToJson(IntValue instance) => <String, dynamic>{
  'value': instance.value,
  'type': instance.$type,
};

BoolValue _$BoolValueFromJson(Map<String, dynamic> json) =>
    BoolValue(json['value'] as bool, $type: json['type'] as String?);

Map<String, dynamic> _$BoolValueToJson(BoolValue instance) => <String, dynamic>{
  'value': instance.value,
  'type': instance.$type,
};

TextValue _$TextValueFromJson(Map<String, dynamic> json) =>
    TextValue(json['value'] as String, $type: json['type'] as String?);

Map<String, dynamic> _$TextValueToJson(TextValue instance) => <String, dynamic>{
  'value': instance.value,
  'type': instance.$type,
};
