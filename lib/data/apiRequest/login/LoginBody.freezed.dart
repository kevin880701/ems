// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) {
  return _LoginBody.fromJson(json);
}

/// @nodoc
mixin _$LoginBody {
  @JsonKey(name: 'acc')
  String get acc => throw _privateConstructorUsedError;
  @JsonKey(name: 'pwd')
  String get pwd => throw _privateConstructorUsedError;

  /// Serializes this LoginBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginBodyCopyWith<LoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginBodyCopyWith<$Res> {
  factory $LoginBodyCopyWith(LoginBody value, $Res Function(LoginBody) then) =
      _$LoginBodyCopyWithImpl<$Res, LoginBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'acc') String acc, @JsonKey(name: 'pwd') String pwd});
}

/// @nodoc
class _$LoginBodyCopyWithImpl<$Res, $Val extends LoginBody>
    implements $LoginBodyCopyWith<$Res> {
  _$LoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acc = null,
    Object? pwd = null,
  }) {
    return _then(_value.copyWith(
      acc: null == acc
          ? _value.acc
          : acc // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginBodyImplCopyWith<$Res>
    implements $LoginBodyCopyWith<$Res> {
  factory _$$LoginBodyImplCopyWith(
          _$LoginBodyImpl value, $Res Function(_$LoginBodyImpl) then) =
      __$$LoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'acc') String acc, @JsonKey(name: 'pwd') String pwd});
}

/// @nodoc
class __$$LoginBodyImplCopyWithImpl<$Res>
    extends _$LoginBodyCopyWithImpl<$Res, _$LoginBodyImpl>
    implements _$$LoginBodyImplCopyWith<$Res> {
  __$$LoginBodyImplCopyWithImpl(
      _$LoginBodyImpl _value, $Res Function(_$LoginBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acc = null,
    Object? pwd = null,
  }) {
    return _then(_$LoginBodyImpl(
      acc: null == acc
          ? _value.acc
          : acc // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginBodyImpl implements _LoginBody {
  const _$LoginBodyImpl(
      {@JsonKey(name: 'acc') required this.acc,
      @JsonKey(name: 'pwd') required this.pwd});

  factory _$LoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginBodyImplFromJson(json);

  @override
  @JsonKey(name: 'acc')
  final String acc;
  @override
  @JsonKey(name: 'pwd')
  final String pwd;

  @override
  String toString() {
    return 'LoginBody(acc: $acc, pwd: $pwd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginBodyImpl &&
            (identical(other.acc, acc) || other.acc == acc) &&
            (identical(other.pwd, pwd) || other.pwd == pwd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, acc, pwd);

  /// Create a copy of LoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginBodyImplCopyWith<_$LoginBodyImpl> get copyWith =>
      __$$LoginBodyImplCopyWithImpl<_$LoginBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginBodyImplToJson(
      this,
    );
  }
}

abstract class _LoginBody implements LoginBody {
  const factory _LoginBody(
      {@JsonKey(name: 'acc') required final String acc,
      @JsonKey(name: 'pwd') required final String pwd}) = _$LoginBodyImpl;

  factory _LoginBody.fromJson(Map<String, dynamic> json) =
      _$LoginBodyImpl.fromJson;

  @override
  @JsonKey(name: 'acc')
  String get acc;
  @override
  @JsonKey(name: 'pwd')
  String get pwd;

  /// Create a copy of LoginBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginBodyImplCopyWith<_$LoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
