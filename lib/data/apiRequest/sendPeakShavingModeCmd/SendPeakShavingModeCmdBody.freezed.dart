// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SendPeakShavingModeCmdBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendPeakShavingModeCmdBody _$SendPeakShavingModeCmdBodyFromJson(
    Map<String, dynamic> json) {
  return _SendPeakShavingModeCmdBody.fromJson(json);
}

/// @nodoc
mixin _$SendPeakShavingModeCmdBody {
  @JsonKey(name: 'M11')
  String get m11 => throw _privateConstructorUsedError;
  @JsonKey(name: 'M21')
  String? get m21 => throw _privateConstructorUsedError;

  /// Serializes this SendPeakShavingModeCmdBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendPeakShavingModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendPeakShavingModeCmdBodyCopyWith<SendPeakShavingModeCmdBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendPeakShavingModeCmdBodyCopyWith<$Res> {
  factory $SendPeakShavingModeCmdBodyCopyWith(SendPeakShavingModeCmdBody value,
          $Res Function(SendPeakShavingModeCmdBody) then) =
      _$SendPeakShavingModeCmdBodyCopyWithImpl<$Res,
          SendPeakShavingModeCmdBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'M11') String m11, @JsonKey(name: 'M21') String? m21});
}

/// @nodoc
class _$SendPeakShavingModeCmdBodyCopyWithImpl<$Res,
        $Val extends SendPeakShavingModeCmdBody>
    implements $SendPeakShavingModeCmdBodyCopyWith<$Res> {
  _$SendPeakShavingModeCmdBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendPeakShavingModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m11 = null,
    Object? m21 = freezed,
  }) {
    return _then(_value.copyWith(
      m11: null == m11
          ? _value.m11
          : m11 // ignore: cast_nullable_to_non_nullable
              as String,
      m21: freezed == m21
          ? _value.m21
          : m21 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendPeakShavingModeCmdBodyImplCopyWith<$Res>
    implements $SendPeakShavingModeCmdBodyCopyWith<$Res> {
  factory _$$SendPeakShavingModeCmdBodyImplCopyWith(
          _$SendPeakShavingModeCmdBodyImpl value,
          $Res Function(_$SendPeakShavingModeCmdBodyImpl) then) =
      __$$SendPeakShavingModeCmdBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'M11') String m11, @JsonKey(name: 'M21') String? m21});
}

/// @nodoc
class __$$SendPeakShavingModeCmdBodyImplCopyWithImpl<$Res>
    extends _$SendPeakShavingModeCmdBodyCopyWithImpl<$Res,
        _$SendPeakShavingModeCmdBodyImpl>
    implements _$$SendPeakShavingModeCmdBodyImplCopyWith<$Res> {
  __$$SendPeakShavingModeCmdBodyImplCopyWithImpl(
      _$SendPeakShavingModeCmdBodyImpl _value,
      $Res Function(_$SendPeakShavingModeCmdBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendPeakShavingModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m11 = null,
    Object? m21 = freezed,
  }) {
    return _then(_$SendPeakShavingModeCmdBodyImpl(
      m11: null == m11
          ? _value.m11
          : m11 // ignore: cast_nullable_to_non_nullable
              as String,
      m21: freezed == m21
          ? _value.m21
          : m21 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendPeakShavingModeCmdBodyImpl implements _SendPeakShavingModeCmdBody {
  const _$SendPeakShavingModeCmdBodyImpl(
      {@JsonKey(name: 'M11') required this.m11,
      @JsonKey(name: 'M21') this.m21});

  factory _$SendPeakShavingModeCmdBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SendPeakShavingModeCmdBodyImplFromJson(json);

  @override
  @JsonKey(name: 'M11')
  final String m11;
  @override
  @JsonKey(name: 'M21')
  final String? m21;

  @override
  String toString() {
    return 'SendPeakShavingModeCmdBody(m11: $m11, m21: $m21)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPeakShavingModeCmdBodyImpl &&
            (identical(other.m11, m11) || other.m11 == m11) &&
            (identical(other.m21, m21) || other.m21 == m21));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, m11, m21);

  /// Create a copy of SendPeakShavingModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPeakShavingModeCmdBodyImplCopyWith<_$SendPeakShavingModeCmdBodyImpl>
      get copyWith => __$$SendPeakShavingModeCmdBodyImplCopyWithImpl<
          _$SendPeakShavingModeCmdBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendPeakShavingModeCmdBodyImplToJson(
      this,
    );
  }
}

abstract class _SendPeakShavingModeCmdBody
    implements SendPeakShavingModeCmdBody {
  const factory _SendPeakShavingModeCmdBody(
          {@JsonKey(name: 'M11') required final String m11,
          @JsonKey(name: 'M21') final String? m21}) =
      _$SendPeakShavingModeCmdBodyImpl;

  factory _SendPeakShavingModeCmdBody.fromJson(Map<String, dynamic> json) =
      _$SendPeakShavingModeCmdBodyImpl.fromJson;

  @override
  @JsonKey(name: 'M11')
  String get m11;
  @override
  @JsonKey(name: 'M21')
  String? get m21;

  /// Create a copy of SendPeakShavingModeCmdBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPeakShavingModeCmdBodyImplCopyWith<_$SendPeakShavingModeCmdBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
