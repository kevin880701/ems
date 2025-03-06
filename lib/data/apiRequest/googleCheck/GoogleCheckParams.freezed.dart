// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GoogleCheckParams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleCheckParams _$GoogleCheckParamsFromJson(Map<String, dynamic> json) {
  return _GoogleCheckParams.fromJson(json);
}

/// @nodoc
mixin _$GoogleCheckParams {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;

  /// Serializes this GoogleCheckParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleCheckParamsCopyWith<GoogleCheckParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleCheckParamsCopyWith<$Res> {
  factory $GoogleCheckParamsCopyWith(
          GoogleCheckParams value, $Res Function(GoogleCheckParams) then) =
      _$GoogleCheckParamsCopyWithImpl<$Res, GoogleCheckParams>;
  @useResult
  $Res call({@JsonKey(name: 'uid') String uid});
}

/// @nodoc
class _$GoogleCheckParamsCopyWithImpl<$Res, $Val extends GoogleCheckParams>
    implements $GoogleCheckParamsCopyWith<$Res> {
  _$GoogleCheckParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleCheckParamsImplCopyWith<$Res>
    implements $GoogleCheckParamsCopyWith<$Res> {
  factory _$$GoogleCheckParamsImplCopyWith(_$GoogleCheckParamsImpl value,
          $Res Function(_$GoogleCheckParamsImpl) then) =
      __$$GoogleCheckParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'uid') String uid});
}

/// @nodoc
class __$$GoogleCheckParamsImplCopyWithImpl<$Res>
    extends _$GoogleCheckParamsCopyWithImpl<$Res, _$GoogleCheckParamsImpl>
    implements _$$GoogleCheckParamsImplCopyWith<$Res> {
  __$$GoogleCheckParamsImplCopyWithImpl(_$GoogleCheckParamsImpl _value,
      $Res Function(_$GoogleCheckParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$GoogleCheckParamsImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleCheckParamsImpl implements _GoogleCheckParams {
  const _$GoogleCheckParamsImpl({@JsonKey(name: 'uid') required this.uid});

  factory _$GoogleCheckParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleCheckParamsImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;

  @override
  String toString() {
    return 'GoogleCheckParams(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleCheckParamsImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of GoogleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleCheckParamsImplCopyWith<_$GoogleCheckParamsImpl> get copyWith =>
      __$$GoogleCheckParamsImplCopyWithImpl<_$GoogleCheckParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleCheckParamsImplToJson(
      this,
    );
  }
}

abstract class _GoogleCheckParams implements GoogleCheckParams {
  const factory _GoogleCheckParams(
          {@JsonKey(name: 'uid') required final String uid}) =
      _$GoogleCheckParamsImpl;

  factory _GoogleCheckParams.fromJson(Map<String, dynamic> json) =
      _$GoogleCheckParamsImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;

  /// Create a copy of GoogleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleCheckParamsImplCopyWith<_$GoogleCheckParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
