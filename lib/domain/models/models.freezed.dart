// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThermocycleSettings {

 double get coldBathTemp; double get hotBathTemp; double get temperatureTolerance; int get dwellTimeSeconds; int get transferTimeSeconds; int get drainingTimeSeconds; int get targetCycles;
/// Create a copy of ThermocycleSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThermocycleSettingsCopyWith<ThermocycleSettings> get copyWith => _$ThermocycleSettingsCopyWithImpl<ThermocycleSettings>(this as ThermocycleSettings, _$identity);

  /// Serializes this ThermocycleSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThermocycleSettings&&(identical(other.coldBathTemp, coldBathTemp) || other.coldBathTemp == coldBathTemp)&&(identical(other.hotBathTemp, hotBathTemp) || other.hotBathTemp == hotBathTemp)&&(identical(other.temperatureTolerance, temperatureTolerance) || other.temperatureTolerance == temperatureTolerance)&&(identical(other.dwellTimeSeconds, dwellTimeSeconds) || other.dwellTimeSeconds == dwellTimeSeconds)&&(identical(other.transferTimeSeconds, transferTimeSeconds) || other.transferTimeSeconds == transferTimeSeconds)&&(identical(other.drainingTimeSeconds, drainingTimeSeconds) || other.drainingTimeSeconds == drainingTimeSeconds)&&(identical(other.targetCycles, targetCycles) || other.targetCycles == targetCycles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coldBathTemp,hotBathTemp,temperatureTolerance,dwellTimeSeconds,transferTimeSeconds,drainingTimeSeconds,targetCycles);

@override
String toString() {
  return 'ThermocycleSettings(coldBathTemp: $coldBathTemp, hotBathTemp: $hotBathTemp, temperatureTolerance: $temperatureTolerance, dwellTimeSeconds: $dwellTimeSeconds, transferTimeSeconds: $transferTimeSeconds, drainingTimeSeconds: $drainingTimeSeconds, targetCycles: $targetCycles)';
}


}

/// @nodoc
abstract mixin class $ThermocycleSettingsCopyWith<$Res>  {
  factory $ThermocycleSettingsCopyWith(ThermocycleSettings value, $Res Function(ThermocycleSettings) _then) = _$ThermocycleSettingsCopyWithImpl;
@useResult
$Res call({
 double coldBathTemp, double hotBathTemp, double temperatureTolerance, int dwellTimeSeconds, int transferTimeSeconds, int drainingTimeSeconds, int targetCycles
});




}
/// @nodoc
class _$ThermocycleSettingsCopyWithImpl<$Res>
    implements $ThermocycleSettingsCopyWith<$Res> {
  _$ThermocycleSettingsCopyWithImpl(this._self, this._then);

  final ThermocycleSettings _self;
  final $Res Function(ThermocycleSettings) _then;

/// Create a copy of ThermocycleSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coldBathTemp = null,Object? hotBathTemp = null,Object? temperatureTolerance = null,Object? dwellTimeSeconds = null,Object? transferTimeSeconds = null,Object? drainingTimeSeconds = null,Object? targetCycles = null,}) {
  return _then(_self.copyWith(
coldBathTemp: null == coldBathTemp ? _self.coldBathTemp : coldBathTemp // ignore: cast_nullable_to_non_nullable
as double,hotBathTemp: null == hotBathTemp ? _self.hotBathTemp : hotBathTemp // ignore: cast_nullable_to_non_nullable
as double,temperatureTolerance: null == temperatureTolerance ? _self.temperatureTolerance : temperatureTolerance // ignore: cast_nullable_to_non_nullable
as double,dwellTimeSeconds: null == dwellTimeSeconds ? _self.dwellTimeSeconds : dwellTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,transferTimeSeconds: null == transferTimeSeconds ? _self.transferTimeSeconds : transferTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,drainingTimeSeconds: null == drainingTimeSeconds ? _self.drainingTimeSeconds : drainingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,targetCycles: null == targetCycles ? _self.targetCycles : targetCycles // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ThermocycleSettings].
extension ThermocycleSettingsPatterns on ThermocycleSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThermocycleSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThermocycleSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThermocycleSettings value)  $default,){
final _that = this;
switch (_that) {
case _ThermocycleSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThermocycleSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ThermocycleSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double coldBathTemp,  double hotBathTemp,  double temperatureTolerance,  int dwellTimeSeconds,  int transferTimeSeconds,  int drainingTimeSeconds,  int targetCycles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThermocycleSettings() when $default != null:
return $default(_that.coldBathTemp,_that.hotBathTemp,_that.temperatureTolerance,_that.dwellTimeSeconds,_that.transferTimeSeconds,_that.drainingTimeSeconds,_that.targetCycles);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double coldBathTemp,  double hotBathTemp,  double temperatureTolerance,  int dwellTimeSeconds,  int transferTimeSeconds,  int drainingTimeSeconds,  int targetCycles)  $default,) {final _that = this;
switch (_that) {
case _ThermocycleSettings():
return $default(_that.coldBathTemp,_that.hotBathTemp,_that.temperatureTolerance,_that.dwellTimeSeconds,_that.transferTimeSeconds,_that.drainingTimeSeconds,_that.targetCycles);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double coldBathTemp,  double hotBathTemp,  double temperatureTolerance,  int dwellTimeSeconds,  int transferTimeSeconds,  int drainingTimeSeconds,  int targetCycles)?  $default,) {final _that = this;
switch (_that) {
case _ThermocycleSettings() when $default != null:
return $default(_that.coldBathTemp,_that.hotBathTemp,_that.temperatureTolerance,_that.dwellTimeSeconds,_that.transferTimeSeconds,_that.drainingTimeSeconds,_that.targetCycles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThermocycleSettings extends ThermocycleSettings {
  const _ThermocycleSettings({this.coldBathTemp = 5.0, this.hotBathTemp = 55.0, this.temperatureTolerance = 2.0, this.dwellTimeSeconds = 30, this.transferTimeSeconds = 10, this.drainingTimeSeconds = 0, this.targetCycles = 1000}): super._();
  factory _ThermocycleSettings.fromJson(Map<String, dynamic> json) => _$ThermocycleSettingsFromJson(json);

@override@JsonKey() final  double coldBathTemp;
@override@JsonKey() final  double hotBathTemp;
@override@JsonKey() final  double temperatureTolerance;
@override@JsonKey() final  int dwellTimeSeconds;
@override@JsonKey() final  int transferTimeSeconds;
@override@JsonKey() final  int drainingTimeSeconds;
@override@JsonKey() final  int targetCycles;

/// Create a copy of ThermocycleSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThermocycleSettingsCopyWith<_ThermocycleSettings> get copyWith => __$ThermocycleSettingsCopyWithImpl<_ThermocycleSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThermocycleSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThermocycleSettings&&(identical(other.coldBathTemp, coldBathTemp) || other.coldBathTemp == coldBathTemp)&&(identical(other.hotBathTemp, hotBathTemp) || other.hotBathTemp == hotBathTemp)&&(identical(other.temperatureTolerance, temperatureTolerance) || other.temperatureTolerance == temperatureTolerance)&&(identical(other.dwellTimeSeconds, dwellTimeSeconds) || other.dwellTimeSeconds == dwellTimeSeconds)&&(identical(other.transferTimeSeconds, transferTimeSeconds) || other.transferTimeSeconds == transferTimeSeconds)&&(identical(other.drainingTimeSeconds, drainingTimeSeconds) || other.drainingTimeSeconds == drainingTimeSeconds)&&(identical(other.targetCycles, targetCycles) || other.targetCycles == targetCycles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coldBathTemp,hotBathTemp,temperatureTolerance,dwellTimeSeconds,transferTimeSeconds,drainingTimeSeconds,targetCycles);

@override
String toString() {
  return 'ThermocycleSettings(coldBathTemp: $coldBathTemp, hotBathTemp: $hotBathTemp, temperatureTolerance: $temperatureTolerance, dwellTimeSeconds: $dwellTimeSeconds, transferTimeSeconds: $transferTimeSeconds, drainingTimeSeconds: $drainingTimeSeconds, targetCycles: $targetCycles)';
}


}

/// @nodoc
abstract mixin class _$ThermocycleSettingsCopyWith<$Res> implements $ThermocycleSettingsCopyWith<$Res> {
  factory _$ThermocycleSettingsCopyWith(_ThermocycleSettings value, $Res Function(_ThermocycleSettings) _then) = __$ThermocycleSettingsCopyWithImpl;
@override @useResult
$Res call({
 double coldBathTemp, double hotBathTemp, double temperatureTolerance, int dwellTimeSeconds, int transferTimeSeconds, int drainingTimeSeconds, int targetCycles
});




}
/// @nodoc
class __$ThermocycleSettingsCopyWithImpl<$Res>
    implements _$ThermocycleSettingsCopyWith<$Res> {
  __$ThermocycleSettingsCopyWithImpl(this._self, this._then);

  final _ThermocycleSettings _self;
  final $Res Function(_ThermocycleSettings) _then;

/// Create a copy of ThermocycleSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coldBathTemp = null,Object? hotBathTemp = null,Object? temperatureTolerance = null,Object? dwellTimeSeconds = null,Object? transferTimeSeconds = null,Object? drainingTimeSeconds = null,Object? targetCycles = null,}) {
  return _then(_ThermocycleSettings(
coldBathTemp: null == coldBathTemp ? _self.coldBathTemp : coldBathTemp // ignore: cast_nullable_to_non_nullable
as double,hotBathTemp: null == hotBathTemp ? _self.hotBathTemp : hotBathTemp // ignore: cast_nullable_to_non_nullable
as double,temperatureTolerance: null == temperatureTolerance ? _self.temperatureTolerance : temperatureTolerance // ignore: cast_nullable_to_non_nullable
as double,dwellTimeSeconds: null == dwellTimeSeconds ? _self.dwellTimeSeconds : dwellTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,transferTimeSeconds: null == transferTimeSeconds ? _self.transferTimeSeconds : transferTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,drainingTimeSeconds: null == drainingTimeSeconds ? _self.drainingTimeSeconds : drainingTimeSeconds // ignore: cast_nullable_to_non_nullable
as int,targetCycles: null == targetCycles ? _self.targetCycles : targetCycles // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ConstantModeSettings {

 double get targetTemp; bool get isInfinite; Duration get duration;
/// Create a copy of ConstantModeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstantModeSettingsCopyWith<ConstantModeSettings> get copyWith => _$ConstantModeSettingsCopyWithImpl<ConstantModeSettings>(this as ConstantModeSettings, _$identity);

  /// Serializes this ConstantModeSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstantModeSettings&&(identical(other.targetTemp, targetTemp) || other.targetTemp == targetTemp)&&(identical(other.isInfinite, isInfinite) || other.isInfinite == isInfinite)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetTemp,isInfinite,duration);

@override
String toString() {
  return 'ConstantModeSettings(targetTemp: $targetTemp, isInfinite: $isInfinite, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ConstantModeSettingsCopyWith<$Res>  {
  factory $ConstantModeSettingsCopyWith(ConstantModeSettings value, $Res Function(ConstantModeSettings) _then) = _$ConstantModeSettingsCopyWithImpl;
@useResult
$Res call({
 double targetTemp, bool isInfinite, Duration duration
});




}
/// @nodoc
class _$ConstantModeSettingsCopyWithImpl<$Res>
    implements $ConstantModeSettingsCopyWith<$Res> {
  _$ConstantModeSettingsCopyWithImpl(this._self, this._then);

  final ConstantModeSettings _self;
  final $Res Function(ConstantModeSettings) _then;

/// Create a copy of ConstantModeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetTemp = null,Object? isInfinite = null,Object? duration = null,}) {
  return _then(_self.copyWith(
targetTemp: null == targetTemp ? _self.targetTemp : targetTemp // ignore: cast_nullable_to_non_nullable
as double,isInfinite: null == isInfinite ? _self.isInfinite : isInfinite // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ConstantModeSettings].
extension ConstantModeSettingsPatterns on ConstantModeSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConstantModeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConstantModeSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConstantModeSettings value)  $default,){
final _that = this;
switch (_that) {
case _ConstantModeSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConstantModeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ConstantModeSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double targetTemp,  bool isInfinite,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConstantModeSettings() when $default != null:
return $default(_that.targetTemp,_that.isInfinite,_that.duration);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double targetTemp,  bool isInfinite,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _ConstantModeSettings():
return $default(_that.targetTemp,_that.isInfinite,_that.duration);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double targetTemp,  bool isInfinite,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _ConstantModeSettings() when $default != null:
return $default(_that.targetTemp,_that.isInfinite,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConstantModeSettings extends ConstantModeSettings {
  const _ConstantModeSettings({this.targetTemp = 37.0, this.isInfinite = true, this.duration = const Duration(hours: 0)}): super._();
  factory _ConstantModeSettings.fromJson(Map<String, dynamic> json) => _$ConstantModeSettingsFromJson(json);

@override@JsonKey() final  double targetTemp;
@override@JsonKey() final  bool isInfinite;
@override@JsonKey() final  Duration duration;

/// Create a copy of ConstantModeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstantModeSettingsCopyWith<_ConstantModeSettings> get copyWith => __$ConstantModeSettingsCopyWithImpl<_ConstantModeSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConstantModeSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConstantModeSettings&&(identical(other.targetTemp, targetTemp) || other.targetTemp == targetTemp)&&(identical(other.isInfinite, isInfinite) || other.isInfinite == isInfinite)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetTemp,isInfinite,duration);

@override
String toString() {
  return 'ConstantModeSettings(targetTemp: $targetTemp, isInfinite: $isInfinite, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ConstantModeSettingsCopyWith<$Res> implements $ConstantModeSettingsCopyWith<$Res> {
  factory _$ConstantModeSettingsCopyWith(_ConstantModeSettings value, $Res Function(_ConstantModeSettings) _then) = __$ConstantModeSettingsCopyWithImpl;
@override @useResult
$Res call({
 double targetTemp, bool isInfinite, Duration duration
});




}
/// @nodoc
class __$ConstantModeSettingsCopyWithImpl<$Res>
    implements _$ConstantModeSettingsCopyWith<$Res> {
  __$ConstantModeSettingsCopyWithImpl(this._self, this._then);

  final _ConstantModeSettings _self;
  final $Res Function(_ConstantModeSettings) _then;

/// Create a copy of ConstantModeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetTemp = null,Object? isInfinite = null,Object? duration = null,}) {
  return _then(_ConstantModeSettings(
targetTemp: null == targetTemp ? _self.targetTemp : targetTemp // ignore: cast_nullable_to_non_nullable
as double,isInfinite: null == isInfinite ? _self.isInfinite : isInfinite // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc
mixin _$DeviceStatus {

 DeviceState get state; OperationMode get mode; double get currentColdBathTemp; double get currentHotBathTemp; double get currentChamberTemp; double get currentChamber1Temp; double get currentChamber2Temp; double get currentChamber3Temp; double get currentChamber4Temp; int get currentCycle; Duration get remainingTime; double get progress;// 0.0 to 1.0
 bool get watchdogStatus; double get levelSensor; int get hitCount; int get p1Pulse; int get p2Pulse; bool get hotFillValve; bool get hotDrainValve; bool get coldFillValve; bool get coldDrainValve;
/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceStatusCopyWith<DeviceStatus> get copyWith => _$DeviceStatusCopyWithImpl<DeviceStatus>(this as DeviceStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.currentColdBathTemp, currentColdBathTemp) || other.currentColdBathTemp == currentColdBathTemp)&&(identical(other.currentHotBathTemp, currentHotBathTemp) || other.currentHotBathTemp == currentHotBathTemp)&&(identical(other.currentChamberTemp, currentChamberTemp) || other.currentChamberTemp == currentChamberTemp)&&(identical(other.currentChamber1Temp, currentChamber1Temp) || other.currentChamber1Temp == currentChamber1Temp)&&(identical(other.currentChamber2Temp, currentChamber2Temp) || other.currentChamber2Temp == currentChamber2Temp)&&(identical(other.currentChamber3Temp, currentChamber3Temp) || other.currentChamber3Temp == currentChamber3Temp)&&(identical(other.currentChamber4Temp, currentChamber4Temp) || other.currentChamber4Temp == currentChamber4Temp)&&(identical(other.currentCycle, currentCycle) || other.currentCycle == currentCycle)&&(identical(other.remainingTime, remainingTime) || other.remainingTime == remainingTime)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.watchdogStatus, watchdogStatus) || other.watchdogStatus == watchdogStatus)&&(identical(other.levelSensor, levelSensor) || other.levelSensor == levelSensor)&&(identical(other.hitCount, hitCount) || other.hitCount == hitCount)&&(identical(other.p1Pulse, p1Pulse) || other.p1Pulse == p1Pulse)&&(identical(other.p2Pulse, p2Pulse) || other.p2Pulse == p2Pulse)&&(identical(other.hotFillValve, hotFillValve) || other.hotFillValve == hotFillValve)&&(identical(other.hotDrainValve, hotDrainValve) || other.hotDrainValve == hotDrainValve)&&(identical(other.coldFillValve, coldFillValve) || other.coldFillValve == coldFillValve)&&(identical(other.coldDrainValve, coldDrainValve) || other.coldDrainValve == coldDrainValve));
}


@override
int get hashCode => Object.hashAll([runtimeType,state,mode,currentColdBathTemp,currentHotBathTemp,currentChamberTemp,currentChamber1Temp,currentChamber2Temp,currentChamber3Temp,currentChamber4Temp,currentCycle,remainingTime,progress,watchdogStatus,levelSensor,hitCount,p1Pulse,p2Pulse,hotFillValve,hotDrainValve,coldFillValve,coldDrainValve]);

@override
String toString() {
  return 'DeviceStatus(state: $state, mode: $mode, currentColdBathTemp: $currentColdBathTemp, currentHotBathTemp: $currentHotBathTemp, currentChamberTemp: $currentChamberTemp, currentChamber1Temp: $currentChamber1Temp, currentChamber2Temp: $currentChamber2Temp, currentChamber3Temp: $currentChamber3Temp, currentChamber4Temp: $currentChamber4Temp, currentCycle: $currentCycle, remainingTime: $remainingTime, progress: $progress, watchdogStatus: $watchdogStatus, levelSensor: $levelSensor, hitCount: $hitCount, p1Pulse: $p1Pulse, p2Pulse: $p2Pulse, hotFillValve: $hotFillValve, hotDrainValve: $hotDrainValve, coldFillValve: $coldFillValve, coldDrainValve: $coldDrainValve)';
}


}

/// @nodoc
abstract mixin class $DeviceStatusCopyWith<$Res>  {
  factory $DeviceStatusCopyWith(DeviceStatus value, $Res Function(DeviceStatus) _then) = _$DeviceStatusCopyWithImpl;
@useResult
$Res call({
 DeviceState state, OperationMode mode, double currentColdBathTemp, double currentHotBathTemp, double currentChamberTemp, double currentChamber1Temp, double currentChamber2Temp, double currentChamber3Temp, double currentChamber4Temp, int currentCycle, Duration remainingTime, double progress, bool watchdogStatus, double levelSensor, int hitCount, int p1Pulse, int p2Pulse, bool hotFillValve, bool hotDrainValve, bool coldFillValve, bool coldDrainValve
});




}
/// @nodoc
class _$DeviceStatusCopyWithImpl<$Res>
    implements $DeviceStatusCopyWith<$Res> {
  _$DeviceStatusCopyWithImpl(this._self, this._then);

  final DeviceStatus _self;
  final $Res Function(DeviceStatus) _then;

/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? mode = null,Object? currentColdBathTemp = null,Object? currentHotBathTemp = null,Object? currentChamberTemp = null,Object? currentChamber1Temp = null,Object? currentChamber2Temp = null,Object? currentChamber3Temp = null,Object? currentChamber4Temp = null,Object? currentCycle = null,Object? remainingTime = null,Object? progress = null,Object? watchdogStatus = null,Object? levelSensor = null,Object? hitCount = null,Object? p1Pulse = null,Object? p2Pulse = null,Object? hotFillValve = null,Object? hotDrainValve = null,Object? coldFillValve = null,Object? coldDrainValve = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DeviceState,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OperationMode,currentColdBathTemp: null == currentColdBathTemp ? _self.currentColdBathTemp : currentColdBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentHotBathTemp: null == currentHotBathTemp ? _self.currentHotBathTemp : currentHotBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamberTemp: null == currentChamberTemp ? _self.currentChamberTemp : currentChamberTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamber1Temp: null == currentChamber1Temp ? _self.currentChamber1Temp : currentChamber1Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber2Temp: null == currentChamber2Temp ? _self.currentChamber2Temp : currentChamber2Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber3Temp: null == currentChamber3Temp ? _self.currentChamber3Temp : currentChamber3Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber4Temp: null == currentChamber4Temp ? _self.currentChamber4Temp : currentChamber4Temp // ignore: cast_nullable_to_non_nullable
as double,currentCycle: null == currentCycle ? _self.currentCycle : currentCycle // ignore: cast_nullable_to_non_nullable
as int,remainingTime: null == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,watchdogStatus: null == watchdogStatus ? _self.watchdogStatus : watchdogStatus // ignore: cast_nullable_to_non_nullable
as bool,levelSensor: null == levelSensor ? _self.levelSensor : levelSensor // ignore: cast_nullable_to_non_nullable
as double,hitCount: null == hitCount ? _self.hitCount : hitCount // ignore: cast_nullable_to_non_nullable
as int,p1Pulse: null == p1Pulse ? _self.p1Pulse : p1Pulse // ignore: cast_nullable_to_non_nullable
as int,p2Pulse: null == p2Pulse ? _self.p2Pulse : p2Pulse // ignore: cast_nullable_to_non_nullable
as int,hotFillValve: null == hotFillValve ? _self.hotFillValve : hotFillValve // ignore: cast_nullable_to_non_nullable
as bool,hotDrainValve: null == hotDrainValve ? _self.hotDrainValve : hotDrainValve // ignore: cast_nullable_to_non_nullable
as bool,coldFillValve: null == coldFillValve ? _self.coldFillValve : coldFillValve // ignore: cast_nullable_to_non_nullable
as bool,coldDrainValve: null == coldDrainValve ? _self.coldDrainValve : coldDrainValve // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceStatus].
extension DeviceStatusPatterns on DeviceStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceStatus value)  $default,){
final _that = this;
switch (_that) {
case _DeviceStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceStatus value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  double currentChamber1Temp,  double currentChamber2Temp,  double currentChamber3Temp,  double currentChamber4Temp,  int currentCycle,  Duration remainingTime,  double progress,  bool watchdogStatus,  double levelSensor,  int hitCount,  int p1Pulse,  int p2Pulse,  bool hotFillValve,  bool hotDrainValve,  bool coldFillValve,  bool coldDrainValve)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentChamber1Temp,_that.currentChamber2Temp,_that.currentChamber3Temp,_that.currentChamber4Temp,_that.currentCycle,_that.remainingTime,_that.progress,_that.watchdogStatus,_that.levelSensor,_that.hitCount,_that.p1Pulse,_that.p2Pulse,_that.hotFillValve,_that.hotDrainValve,_that.coldFillValve,_that.coldDrainValve);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  double currentChamber1Temp,  double currentChamber2Temp,  double currentChamber3Temp,  double currentChamber4Temp,  int currentCycle,  Duration remainingTime,  double progress,  bool watchdogStatus,  double levelSensor,  int hitCount,  int p1Pulse,  int p2Pulse,  bool hotFillValve,  bool hotDrainValve,  bool coldFillValve,  bool coldDrainValve)  $default,) {final _that = this;
switch (_that) {
case _DeviceStatus():
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentChamber1Temp,_that.currentChamber2Temp,_that.currentChamber3Temp,_that.currentChamber4Temp,_that.currentCycle,_that.remainingTime,_that.progress,_that.watchdogStatus,_that.levelSensor,_that.hitCount,_that.p1Pulse,_that.p2Pulse,_that.hotFillValve,_that.hotDrainValve,_that.coldFillValve,_that.coldDrainValve);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  double currentChamber1Temp,  double currentChamber2Temp,  double currentChamber3Temp,  double currentChamber4Temp,  int currentCycle,  Duration remainingTime,  double progress,  bool watchdogStatus,  double levelSensor,  int hitCount,  int p1Pulse,  int p2Pulse,  bool hotFillValve,  bool hotDrainValve,  bool coldFillValve,  bool coldDrainValve)?  $default,) {final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentChamber1Temp,_that.currentChamber2Temp,_that.currentChamber3Temp,_that.currentChamber4Temp,_that.currentCycle,_that.remainingTime,_that.progress,_that.watchdogStatus,_that.levelSensor,_that.hitCount,_that.p1Pulse,_that.p2Pulse,_that.hotFillValve,_that.hotDrainValve,_that.coldFillValve,_that.coldDrainValve);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceStatus extends DeviceStatus {
  const _DeviceStatus({this.state = DeviceState.ready, this.mode = OperationMode.idle, this.currentColdBathTemp = 0.0, this.currentHotBathTemp = 0.0, this.currentChamberTemp = 0.0, this.currentChamber1Temp = 0.0, this.currentChamber2Temp = 0.0, this.currentChamber3Temp = 0.0, this.currentChamber4Temp = 0.0, this.currentCycle = 0, this.remainingTime = Duration.zero, this.progress = 0.0, this.watchdogStatus = false, this.levelSensor = 0.0, this.hitCount = 0, this.p1Pulse = 0, this.p2Pulse = 0, this.hotFillValve = false, this.hotDrainValve = false, this.coldFillValve = false, this.coldDrainValve = false}): super._();
  

@override@JsonKey() final  DeviceState state;
@override@JsonKey() final  OperationMode mode;
@override@JsonKey() final  double currentColdBathTemp;
@override@JsonKey() final  double currentHotBathTemp;
@override@JsonKey() final  double currentChamberTemp;
@override@JsonKey() final  double currentChamber1Temp;
@override@JsonKey() final  double currentChamber2Temp;
@override@JsonKey() final  double currentChamber3Temp;
@override@JsonKey() final  double currentChamber4Temp;
@override@JsonKey() final  int currentCycle;
@override@JsonKey() final  Duration remainingTime;
@override@JsonKey() final  double progress;
// 0.0 to 1.0
@override@JsonKey() final  bool watchdogStatus;
@override@JsonKey() final  double levelSensor;
@override@JsonKey() final  int hitCount;
@override@JsonKey() final  int p1Pulse;
@override@JsonKey() final  int p2Pulse;
@override@JsonKey() final  bool hotFillValve;
@override@JsonKey() final  bool hotDrainValve;
@override@JsonKey() final  bool coldFillValve;
@override@JsonKey() final  bool coldDrainValve;

/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceStatusCopyWith<_DeviceStatus> get copyWith => __$DeviceStatusCopyWithImpl<_DeviceStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.currentColdBathTemp, currentColdBathTemp) || other.currentColdBathTemp == currentColdBathTemp)&&(identical(other.currentHotBathTemp, currentHotBathTemp) || other.currentHotBathTemp == currentHotBathTemp)&&(identical(other.currentChamberTemp, currentChamberTemp) || other.currentChamberTemp == currentChamberTemp)&&(identical(other.currentChamber1Temp, currentChamber1Temp) || other.currentChamber1Temp == currentChamber1Temp)&&(identical(other.currentChamber2Temp, currentChamber2Temp) || other.currentChamber2Temp == currentChamber2Temp)&&(identical(other.currentChamber3Temp, currentChamber3Temp) || other.currentChamber3Temp == currentChamber3Temp)&&(identical(other.currentChamber4Temp, currentChamber4Temp) || other.currentChamber4Temp == currentChamber4Temp)&&(identical(other.currentCycle, currentCycle) || other.currentCycle == currentCycle)&&(identical(other.remainingTime, remainingTime) || other.remainingTime == remainingTime)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.watchdogStatus, watchdogStatus) || other.watchdogStatus == watchdogStatus)&&(identical(other.levelSensor, levelSensor) || other.levelSensor == levelSensor)&&(identical(other.hitCount, hitCount) || other.hitCount == hitCount)&&(identical(other.p1Pulse, p1Pulse) || other.p1Pulse == p1Pulse)&&(identical(other.p2Pulse, p2Pulse) || other.p2Pulse == p2Pulse)&&(identical(other.hotFillValve, hotFillValve) || other.hotFillValve == hotFillValve)&&(identical(other.hotDrainValve, hotDrainValve) || other.hotDrainValve == hotDrainValve)&&(identical(other.coldFillValve, coldFillValve) || other.coldFillValve == coldFillValve)&&(identical(other.coldDrainValve, coldDrainValve) || other.coldDrainValve == coldDrainValve));
}


@override
int get hashCode => Object.hashAll([runtimeType,state,mode,currentColdBathTemp,currentHotBathTemp,currentChamberTemp,currentChamber1Temp,currentChamber2Temp,currentChamber3Temp,currentChamber4Temp,currentCycle,remainingTime,progress,watchdogStatus,levelSensor,hitCount,p1Pulse,p2Pulse,hotFillValve,hotDrainValve,coldFillValve,coldDrainValve]);

@override
String toString() {
  return 'DeviceStatus(state: $state, mode: $mode, currentColdBathTemp: $currentColdBathTemp, currentHotBathTemp: $currentHotBathTemp, currentChamberTemp: $currentChamberTemp, currentChamber1Temp: $currentChamber1Temp, currentChamber2Temp: $currentChamber2Temp, currentChamber3Temp: $currentChamber3Temp, currentChamber4Temp: $currentChamber4Temp, currentCycle: $currentCycle, remainingTime: $remainingTime, progress: $progress, watchdogStatus: $watchdogStatus, levelSensor: $levelSensor, hitCount: $hitCount, p1Pulse: $p1Pulse, p2Pulse: $p2Pulse, hotFillValve: $hotFillValve, hotDrainValve: $hotDrainValve, coldFillValve: $coldFillValve, coldDrainValve: $coldDrainValve)';
}


}

/// @nodoc
abstract mixin class _$DeviceStatusCopyWith<$Res> implements $DeviceStatusCopyWith<$Res> {
  factory _$DeviceStatusCopyWith(_DeviceStatus value, $Res Function(_DeviceStatus) _then) = __$DeviceStatusCopyWithImpl;
@override @useResult
$Res call({
 DeviceState state, OperationMode mode, double currentColdBathTemp, double currentHotBathTemp, double currentChamberTemp, double currentChamber1Temp, double currentChamber2Temp, double currentChamber3Temp, double currentChamber4Temp, int currentCycle, Duration remainingTime, double progress, bool watchdogStatus, double levelSensor, int hitCount, int p1Pulse, int p2Pulse, bool hotFillValve, bool hotDrainValve, bool coldFillValve, bool coldDrainValve
});




}
/// @nodoc
class __$DeviceStatusCopyWithImpl<$Res>
    implements _$DeviceStatusCopyWith<$Res> {
  __$DeviceStatusCopyWithImpl(this._self, this._then);

  final _DeviceStatus _self;
  final $Res Function(_DeviceStatus) _then;

/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? mode = null,Object? currentColdBathTemp = null,Object? currentHotBathTemp = null,Object? currentChamberTemp = null,Object? currentChamber1Temp = null,Object? currentChamber2Temp = null,Object? currentChamber3Temp = null,Object? currentChamber4Temp = null,Object? currentCycle = null,Object? remainingTime = null,Object? progress = null,Object? watchdogStatus = null,Object? levelSensor = null,Object? hitCount = null,Object? p1Pulse = null,Object? p2Pulse = null,Object? hotFillValve = null,Object? hotDrainValve = null,Object? coldFillValve = null,Object? coldDrainValve = null,}) {
  return _then(_DeviceStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DeviceState,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OperationMode,currentColdBathTemp: null == currentColdBathTemp ? _self.currentColdBathTemp : currentColdBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentHotBathTemp: null == currentHotBathTemp ? _self.currentHotBathTemp : currentHotBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamberTemp: null == currentChamberTemp ? _self.currentChamberTemp : currentChamberTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamber1Temp: null == currentChamber1Temp ? _self.currentChamber1Temp : currentChamber1Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber2Temp: null == currentChamber2Temp ? _self.currentChamber2Temp : currentChamber2Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber3Temp: null == currentChamber3Temp ? _self.currentChamber3Temp : currentChamber3Temp // ignore: cast_nullable_to_non_nullable
as double,currentChamber4Temp: null == currentChamber4Temp ? _self.currentChamber4Temp : currentChamber4Temp // ignore: cast_nullable_to_non_nullable
as double,currentCycle: null == currentCycle ? _self.currentCycle : currentCycle // ignore: cast_nullable_to_non_nullable
as int,remainingTime: null == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,watchdogStatus: null == watchdogStatus ? _self.watchdogStatus : watchdogStatus // ignore: cast_nullable_to_non_nullable
as bool,levelSensor: null == levelSensor ? _self.levelSensor : levelSensor // ignore: cast_nullable_to_non_nullable
as double,hitCount: null == hitCount ? _self.hitCount : hitCount // ignore: cast_nullable_to_non_nullable
as int,p1Pulse: null == p1Pulse ? _self.p1Pulse : p1Pulse // ignore: cast_nullable_to_non_nullable
as int,p2Pulse: null == p2Pulse ? _self.p2Pulse : p2Pulse // ignore: cast_nullable_to_non_nullable
as int,hotFillValve: null == hotFillValve ? _self.hotFillValve : hotFillValve // ignore: cast_nullable_to_non_nullable
as bool,hotDrainValve: null == hotDrainValve ? _self.hotDrainValve : hotDrainValve // ignore: cast_nullable_to_non_nullable
as bool,coldFillValve: null == coldFillValve ? _self.coldFillValve : coldFillValve // ignore: cast_nullable_to_non_nullable
as bool,coldDrainValve: null == coldDrainValve ? _self.coldDrainValve : coldDrainValve // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
