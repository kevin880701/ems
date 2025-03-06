// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AppleCheckParams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppleCheckParams _$AppleCheckParamsFromJson(Map<String, dynamic> json) {
  return _AppleCheckParams.fromJson(json);
}

/// @nodoc
mixin _$AppleCheckParams {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;

  /// Serializes this AppleCheckParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppleCheckParamsCopyWith<AppleCheckParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleCheckParamsCopyWith<$Res> {
  factory $AppleCheckParamsCopyWith(
          AppleCheckParams value, $Res Function(AppleCheckParams) then) =
      _$AppleCheckParamsCopyWithImpl<$Res, AppleCheckParams>;
  @useResult
  $Res call({@JsonKey(name: 'uid') String uid});
}

/// @nodoc
class _$AppleCheckParamsCopyWithImpl<$Res, $Val extends AppleCheckParams>
    implements $AppleCheckParamsCopyWith<$Res> {
  _$AppleCheckParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppleCheckParams
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
abstract class _$$AppleCheckParamsImplCopyWith<$Res>
    implements $AppleCheckParamsCopyWith<$Res> {
  factory _$$AppleCheckParamsImplCopyWith(_$AppleCheckParamsImpl value,
          $Res Function(_$AppleCheckParamsImpl) then) =
      __$$AppleCheckParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'uid') String uid});
}

/// @nodoc
class __$$AppleCheckParamsImplCopyWithImpl<$Res>
    extends _$AppleCheckParamsCopyWithImpl<$Res, _$AppleCheckParamsImpl>
    implements _$$AppleCheckParamsImplCopyWith<$Res> {
  __$$AppleCheckParamsImplCopyWithImpl(_$AppleCheckParamsImpl _value,
      $Res Function(_$AppleCheckParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$AppleCheckParamsImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleCheckParamsImpl implements _AppleCheckParams {
  const _$AppleCheckParamsImpl({@JsonKey(name: 'uid') required this.uid});

  factory _$AppleCheckParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleCheckParamsImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;

  @override
  String toString() {
    return 'AppleCheckParams(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleCheckParamsImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid);

  /// Create a copy of AppleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleCheckParamsImplCopyWith<_$AppleCheckParamsImpl> get copyWith =>
      __$$AppleCheckParamsImplCopyWithImpl<_$AppleCheckParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleCheckParamsImplToJson(
      this,
    );
  }
}

abstract class _AppleCheckParams implements AppleCheckParams {
  const factory _AppleCheckParams(
          {@JsonKey(name: 'uid') required final String uid}) =
      _$AppleCheckParamsImpl;

  factory _AppleCheckParams.fromJson(Map<String, dynamic> json) =
      _$AppleCheckParamsImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;

  /// Create a copy of AppleCheckParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppleCheckParamsImplCopyWith<_$AppleCheckParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
