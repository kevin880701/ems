// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Attrs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attrs _$AttrsFromJson(Map<String, dynamic> json) {
  return _Attrs.fromJson(json);
}

/// @nodoc
mixin _$Attrs {
  @JsonKey(name: 'Timezone')
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timezone_val')
  String? get timezoneVal => throw _privateConstructorUsedError;
  @JsonKey(name: 'belongUnit')
  String? get belongUnit => throw _privateConstructorUsedError;

  /// Serializes this Attrs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attrs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttrsCopyWith<Attrs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttrsCopyWith<$Res> {
  factory $AttrsCopyWith(Attrs value, $Res Function(Attrs) then) =
      _$AttrsCopyWithImpl<$Res, Attrs>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Timezone') String? timezone,
      @JsonKey(name: 'Timezone_val') String? timezoneVal,
      @JsonKey(name: 'belongUnit') String? belongUnit});
}

/// @nodoc
class _$AttrsCopyWithImpl<$Res, $Val extends Attrs>
    implements $AttrsCopyWith<$Res> {
  _$AttrsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attrs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = freezed,
    Object? timezoneVal = freezed,
    Object? belongUnit = freezed,
  }) {
    return _then(_value.copyWith(
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      timezoneVal: freezed == timezoneVal
          ? _value.timezoneVal
          : timezoneVal // ignore: cast_nullable_to_non_nullable
              as String?,
      belongUnit: freezed == belongUnit
          ? _value.belongUnit
          : belongUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttrsImplCopyWith<$Res> implements $AttrsCopyWith<$Res> {
  factory _$$AttrsImplCopyWith(
          _$AttrsImpl value, $Res Function(_$AttrsImpl) then) =
      __$$AttrsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Timezone') String? timezone,
      @JsonKey(name: 'Timezone_val') String? timezoneVal,
      @JsonKey(name: 'belongUnit') String? belongUnit});
}

/// @nodoc
class __$$AttrsImplCopyWithImpl<$Res>
    extends _$AttrsCopyWithImpl<$Res, _$AttrsImpl>
    implements _$$AttrsImplCopyWith<$Res> {
  __$$AttrsImplCopyWithImpl(
      _$AttrsImpl _value, $Res Function(_$AttrsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attrs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timezone = freezed,
    Object? timezoneVal = freezed,
    Object? belongUnit = freezed,
  }) {
    return _then(_$AttrsImpl(
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      timezoneVal: freezed == timezoneVal
          ? _value.timezoneVal
          : timezoneVal // ignore: cast_nullable_to_non_nullable
              as String?,
      belongUnit: freezed == belongUnit
          ? _value.belongUnit
          : belongUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttrsImpl implements _Attrs {
  const _$AttrsImpl(
      {@JsonKey(name: 'Timezone') this.timezone,
      @JsonKey(name: 'Timezone_val') this.timezoneVal,
      @JsonKey(name: 'belongUnit') this.belongUnit});

  factory _$AttrsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttrsImplFromJson(json);

  @override
  @JsonKey(name: 'Timezone')
  final String? timezone;
  @override
  @JsonKey(name: 'Timezone_val')
  final String? timezoneVal;
  @override
  @JsonKey(name: 'belongUnit')
  final String? belongUnit;

  @override
  String toString() {
    return 'Attrs(timezone: $timezone, timezoneVal: $timezoneVal, belongUnit: $belongUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttrsImpl &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.timezoneVal, timezoneVal) ||
                other.timezoneVal == timezoneVal) &&
            (identical(other.belongUnit, belongUnit) ||
                other.belongUnit == belongUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timezone, timezoneVal, belongUnit);

  /// Create a copy of Attrs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttrsImplCopyWith<_$AttrsImpl> get copyWith =>
      __$$AttrsImplCopyWithImpl<_$AttrsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttrsImplToJson(
      this,
    );
  }
}

abstract class _Attrs implements Attrs {
  const factory _Attrs(
      {@JsonKey(name: 'Timezone') final String? timezone,
      @JsonKey(name: 'Timezone_val') final String? timezoneVal,
      @JsonKey(name: 'belongUnit') final String? belongUnit}) = _$AttrsImpl;

  factory _Attrs.fromJson(Map<String, dynamic> json) = _$AttrsImpl.fromJson;

  @override
  @JsonKey(name: 'Timezone')
  String? get timezone;
  @override
  @JsonKey(name: 'Timezone_val')
  String? get timezoneVal;
  @override
  @JsonKey(name: 'belongUnit')
  String? get belongUnit;

  /// Create a copy of Attrs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttrsImplCopyWith<_$AttrsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
