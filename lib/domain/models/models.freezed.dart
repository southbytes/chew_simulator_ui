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
  const _ConstantModeSettings({this.targetTemp = 37.0, this.isInfinite = true, this.duration = const Duration(hours: 24)}): super._();
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

 DeviceState get state; OperationMode get mode; double get currentColdBathTemp; double get currentHotBathTemp; double get currentChamberTemp; int get currentCycle; Duration get remainingTime; double get progress;
/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceStatusCopyWith<DeviceStatus> get copyWith => _$DeviceStatusCopyWithImpl<DeviceStatus>(this as DeviceStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.currentColdBathTemp, currentColdBathTemp) || other.currentColdBathTemp == currentColdBathTemp)&&(identical(other.currentHotBathTemp, currentHotBathTemp) || other.currentHotBathTemp == currentHotBathTemp)&&(identical(other.currentChamberTemp, currentChamberTemp) || other.currentChamberTemp == currentChamberTemp)&&(identical(other.currentCycle, currentCycle) || other.currentCycle == currentCycle)&&(identical(other.remainingTime, remainingTime) || other.remainingTime == remainingTime)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,state,mode,currentColdBathTemp,currentHotBathTemp,currentChamberTemp,currentCycle,remainingTime,progress);

@override
String toString() {
  return 'DeviceStatus(state: $state, mode: $mode, currentColdBathTemp: $currentColdBathTemp, currentHotBathTemp: $currentHotBathTemp, currentChamberTemp: $currentChamberTemp, currentCycle: $currentCycle, remainingTime: $remainingTime, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $DeviceStatusCopyWith<$Res>  {
  factory $DeviceStatusCopyWith(DeviceStatus value, $Res Function(DeviceStatus) _then) = _$DeviceStatusCopyWithImpl;
@useResult
$Res call({
 DeviceState state, OperationMode mode, double currentColdBathTemp, double currentHotBathTemp, double currentChamberTemp, int currentCycle, Duration remainingTime, double progress
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
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? mode = null,Object? currentColdBathTemp = null,Object? currentHotBathTemp = null,Object? currentChamberTemp = null,Object? currentCycle = null,Object? remainingTime = null,Object? progress = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DeviceState,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OperationMode,currentColdBathTemp: null == currentColdBathTemp ? _self.currentColdBathTemp : currentColdBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentHotBathTemp: null == currentHotBathTemp ? _self.currentHotBathTemp : currentHotBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamberTemp: null == currentChamberTemp ? _self.currentChamberTemp : currentChamberTemp // ignore: cast_nullable_to_non_nullable
as double,currentCycle: null == currentCycle ? _self.currentCycle : currentCycle // ignore: cast_nullable_to_non_nullable
as int,remainingTime: null == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  int currentCycle,  Duration remainingTime,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentCycle,_that.remainingTime,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  int currentCycle,  Duration remainingTime,  double progress)  $default,) {final _that = this;
switch (_that) {
case _DeviceStatus():
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentCycle,_that.remainingTime,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeviceState state,  OperationMode mode,  double currentColdBathTemp,  double currentHotBathTemp,  double currentChamberTemp,  int currentCycle,  Duration remainingTime,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _DeviceStatus() when $default != null:
return $default(_that.state,_that.mode,_that.currentColdBathTemp,_that.currentHotBathTemp,_that.currentChamberTemp,_that.currentCycle,_that.remainingTime,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceStatus extends DeviceStatus {
  const _DeviceStatus({this.state = DeviceState.ready, this.mode = OperationMode.idle, this.currentColdBathTemp = 0.0, this.currentHotBathTemp = 0.0, this.currentChamberTemp = 0.0, this.currentCycle = 0, this.remainingTime = Duration.zero, this.progress = 0.0}): super._();
  

@override@JsonKey() final  DeviceState state;
@override@JsonKey() final  OperationMode mode;
@override@JsonKey() final  double currentColdBathTemp;
@override@JsonKey() final  double currentHotBathTemp;
@override@JsonKey() final  double currentChamberTemp;
@override@JsonKey() final  int currentCycle;
@override@JsonKey() final  Duration remainingTime;
@override@JsonKey() final  double progress;

/// Create a copy of DeviceStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceStatusCopyWith<_DeviceStatus> get copyWith => __$DeviceStatusCopyWithImpl<_DeviceStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.currentColdBathTemp, currentColdBathTemp) || other.currentColdBathTemp == currentColdBathTemp)&&(identical(other.currentHotBathTemp, currentHotBathTemp) || other.currentHotBathTemp == currentHotBathTemp)&&(identical(other.currentChamberTemp, currentChamberTemp) || other.currentChamberTemp == currentChamberTemp)&&(identical(other.currentCycle, currentCycle) || other.currentCycle == currentCycle)&&(identical(other.remainingTime, remainingTime) || other.remainingTime == remainingTime)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,state,mode,currentColdBathTemp,currentHotBathTemp,currentChamberTemp,currentCycle,remainingTime,progress);

@override
String toString() {
  return 'DeviceStatus(state: $state, mode: $mode, currentColdBathTemp: $currentColdBathTemp, currentHotBathTemp: $currentHotBathTemp, currentChamberTemp: $currentChamberTemp, currentCycle: $currentCycle, remainingTime: $remainingTime, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$DeviceStatusCopyWith<$Res> implements $DeviceStatusCopyWith<$Res> {
  factory _$DeviceStatusCopyWith(_DeviceStatus value, $Res Function(_DeviceStatus) _then) = __$DeviceStatusCopyWithImpl;
@override @useResult
$Res call({
 DeviceState state, OperationMode mode, double currentColdBathTemp, double currentHotBathTemp, double currentChamberTemp, int currentCycle, Duration remainingTime, double progress
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
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? mode = null,Object? currentColdBathTemp = null,Object? currentHotBathTemp = null,Object? currentChamberTemp = null,Object? currentCycle = null,Object? remainingTime = null,Object? progress = null,}) {
  return _then(_DeviceStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DeviceState,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OperationMode,currentColdBathTemp: null == currentColdBathTemp ? _self.currentColdBathTemp : currentColdBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentHotBathTemp: null == currentHotBathTemp ? _self.currentHotBathTemp : currentHotBathTemp // ignore: cast_nullable_to_non_nullable
as double,currentChamberTemp: null == currentChamberTemp ? _self.currentChamberTemp : currentChamberTemp // ignore: cast_nullable_to_non_nullable
as double,currentCycle: null == currentCycle ? _self.currentCycle : currentCycle // ignore: cast_nullable_to_non_nullable
as int,remainingTime: null == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
