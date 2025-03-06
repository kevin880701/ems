// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SendBatteryPriorityModeCmdBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendBatteryPriorityModeCmdBody _$SendBatteryPriorityModeCmdBodyFromJson(
    Map<String, dynamic> json) {
  return _SendBatteryPriorityModeCmdBody.fromJson(json);
}

/// @nodoc
mixin _$SendBatteryPriorityModeCmdBody {
  @JsonKey(name: 'S8')
  String get s8 => throw _privateConstructorUsedError;

  /// Serializes this SendBatteryPriorityModeCmdBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendBatteryPriorityModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendBatteryPriorityModeCmdBodyCopyWith<SendBatteryPriorityModeCmdBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendBatteryPriorityModeCmdBodyCopyWith<$Res> {
  factory $SendBatteryPriorityModeCmdBodyCopyWith(
          SendBatteryPriorityModeCmdBody value,
          $Res Function(SendBatteryPriorityModeCmdBody) then) =
      _$SendBatteryPriorityModeCmdBodyCopyWithImpl<$Res,
          SendBatteryPriorityModeCmdBody>;
  @useResult
  $Res call({@JsonKey(name: 'S8') String s8});
}

/// @nodoc
class _$SendBatteryPriorityModeCmdBodyCopyWithImpl<$Res,
        $Val extends SendBatteryPriorityModeCmdBody>
    implements $SendBatteryPriorityModeCmdBodyCopyWith<$Res> {
  _$SendBatteryPriorityModeCmdBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendBatteryPriorityModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? s8 = null,
  }) {
    return _then(_value.copyWith(
      s8: null == s8
          ? _value.s8
          : s8 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendBatteryPriorityModeCmdBodyImplCopyWith<$Res>
    implements $SendBatteryPriorityModeCmdBodyCopyWith<$Res> {
  factory _$$SendBatteryPriorityModeCmdBodyImplCopyWith(
          _$SendBatteryPriorityModeCmdBodyImpl value,
          $Res Function(_$SendBatteryPriorityModeCmdBodyImpl) then) =
      __$$SendBatteryPriorityModeCmdBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'S8') String s8});
}

/// @nodoc
class __$$SendBatteryPriorityModeCmdBodyImplCopyWithImpl<$Res>
    extends _$SendBatteryPriorityModeCmdBodyCopyWithImpl<$Res,
        _$SendBatteryPriorityModeCmdBodyImpl>
    implements _$$SendBatteryPriorityModeCmdBodyImplCopyWith<$Res> {
  __$$SendBatteryPriorityModeCmdBodyImplCopyWithImpl(
      _$SendBatteryPriorityModeCmdBodyImpl _value,
      $Res Function(_$SendBatteryPriorityModeCmdBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendBatteryPriorityModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? s8 = null,
  }) {
    return _then(_$SendBatteryPriorityModeCmdBodyImpl(
      s8: null == s8
          ? _value.s8
          : s8 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendBatteryPriorityModeCmdBodyImpl
    implements _SendBatteryPriorityModeCmdBody {
  const _$SendBatteryPriorityModeCmdBodyImpl(
      {@JsonKey(name: 'S8') required this.s8});

  factory _$SendBatteryPriorityModeCmdBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SendBatteryPriorityModeCmdBodyImplFromJson(json);

  @override
  @JsonKey(name: 'S8')
  final String s8;

  @override
  String toString() {
    return 'SendBatteryPriorityModeCmdBody(s8: $s8)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendBatteryPriorityModeCmdBodyImpl &&
            (identical(other.s8, s8) || other.s8 == s8));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, s8);

  /// Create a copy of SendBatteryPriorityModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendBatteryPriorityModeCmdBodyImplCopyWith<
          _$SendBatteryPriorityModeCmdBodyImpl>
      get copyWith => __$$SendBatteryPriorityModeCmdBodyImplCopyWithImpl<
          _$SendBatteryPriorityModeCmdBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendBatteryPriorityModeCmdBodyImplToJson(
      this,
    );
  }
}

abstract class _SendBatteryPriorityModeCmdBody
    implements SendBatteryPriorityModeCmdBody {
  const factory _SendBatteryPriorityModeCmdBody(
          {@JsonKey(name: 'S8') required final String s8}) =
      _$SendBatteryPriorityModeCmdBodyImpl;

  factory _SendBatteryPriorityModeCmdBody.fromJson(Map<String, dynamic> json) =
      _$SendBatteryPriorityModeCmdBodyImpl.fromJson;

  @override
  @JsonKey(name: 'S8')
  String get s8;

  /// Create a copy of SendBatteryPriorityModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendBatteryPriorityModeCmdBodyImplCopyWith<
          _$SendBatteryPriorityModeCmdBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
