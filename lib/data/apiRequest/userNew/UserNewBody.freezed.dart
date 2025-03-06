// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserNewBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserNewBody _$UserNewBodyFromJson(Map<String, dynamic> json) {
  return _UserNewBody.fromJson(json);
}

/// @nodoc
mixin _$UserNewBody {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'acc')
  String get acc => throw _privateConstructorUsedError;
  @JsonKey(name: 'pwd')
  String get pwd => throw _privateConstructorUsedError;

  /// Serializes this UserNewBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserNewBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserNewBodyCopyWith<UserNewBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNewBodyCopyWith<$Res> {
  factory $UserNewBodyCopyWith(
          UserNewBody value, $Res Function(UserNewBody) then) =
      _$UserNewBodyCopyWithImpl<$Res, UserNewBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'acc') String acc,
      @JsonKey(name: 'pwd') String pwd});
}

/// @nodoc
class _$UserNewBodyCopyWithImpl<$Res, $Val extends UserNewBody>
    implements $UserNewBodyCopyWith<$Res> {
  _$UserNewBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserNewBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? acc = null,
    Object? pwd = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$UserNewBodyImplCopyWith<$Res>
    implements $UserNewBodyCopyWith<$Res> {
  factory _$$UserNewBodyImplCopyWith(
          _$UserNewBodyImpl value, $Res Function(_$UserNewBodyImpl) then) =
      __$$UserNewBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'acc') String acc,
      @JsonKey(name: 'pwd') String pwd});
}

/// @nodoc
class __$$UserNewBodyImplCopyWithImpl<$Res>
    extends _$UserNewBodyCopyWithImpl<$Res, _$UserNewBodyImpl>
    implements _$$UserNewBodyImplCopyWith<$Res> {
  __$$UserNewBodyImplCopyWithImpl(
      _$UserNewBodyImpl _value, $Res Function(_$UserNewBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserNewBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? acc = null,
    Object? pwd = null,
  }) {
    return _then(_$UserNewBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$UserNewBodyImpl implements _UserNewBody {
  const _$UserNewBodyImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'acc') required this.acc,
      @JsonKey(name: 'pwd') required this.pwd});

  factory _$UserNewBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNewBodyImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'acc')
  final String acc;
  @override
  @JsonKey(name: 'pwd')
  final String pwd;

  @override
  String toString() {
    return 'UserNewBody(name: $name, acc: $acc, pwd: $pwd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNewBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.acc, acc) || other.acc == acc) &&
            (identical(other.pwd, pwd) || other.pwd == pwd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, acc, pwd);

  /// Create a copy of UserNewBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNewBodyImplCopyWith<_$UserNewBodyImpl> get copyWith =>
      __$$UserNewBodyImplCopyWithImpl<_$UserNewBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNewBodyImplToJson(
      this,
    );
  }
}

abstract class _UserNewBody implements UserNewBody {
  const factory _UserNewBody(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'acc') required final String acc,
      @JsonKey(name: 'pwd') required final String pwd}) = _$UserNewBodyImpl;

  factory _UserNewBody.fromJson(Map<String, dynamic> json) =
      _$UserNewBodyImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'acc')
  String get acc;
  @override
  @JsonKey(name: 'pwd')
  String get pwd;

  /// Create a copy of UserNewBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNewBodyImplCopyWith<_$UserNewBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
