// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SetAvatarBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetAvatarBody _$SetAvatarBodyFromJson(Map<String, dynamic> json) {
  return _SetAvatarBody.fromJson(json);
}

/// @nodoc
mixin _$SetAvatarBody {
  @JsonKey(name: 'avatar')
  String get avatar => throw _privateConstructorUsedError;

  /// Serializes this SetAvatarBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetAvatarBodyCopyWith<SetAvatarBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetAvatarBodyCopyWith<$Res> {
  factory $SetAvatarBodyCopyWith(
          SetAvatarBody value, $Res Function(SetAvatarBody) then) =
      _$SetAvatarBodyCopyWithImpl<$Res, SetAvatarBody>;
  @useResult
  $Res call({@JsonKey(name: 'avatar') String avatar});
}

/// @nodoc
class _$SetAvatarBodyCopyWithImpl<$Res, $Val extends SetAvatarBody>
    implements $SetAvatarBodyCopyWith<$Res> {
  _$SetAvatarBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetAvatarBodyImplCopyWith<$Res>
    implements $SetAvatarBodyCopyWith<$Res> {
  factory _$$SetAvatarBodyImplCopyWith(
          _$SetAvatarBodyImpl value, $Res Function(_$SetAvatarBodyImpl) then) =
      __$$SetAvatarBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar') String avatar});
}

/// @nodoc
class __$$SetAvatarBodyImplCopyWithImpl<$Res>
    extends _$SetAvatarBodyCopyWithImpl<$Res, _$SetAvatarBodyImpl>
    implements _$$SetAvatarBodyImplCopyWith<$Res> {
  __$$SetAvatarBodyImplCopyWithImpl(
      _$SetAvatarBodyImpl _value, $Res Function(_$SetAvatarBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
  }) {
    return _then(_$SetAvatarBodyImpl(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetAvatarBodyImpl implements _SetAvatarBody {
  const _$SetAvatarBodyImpl({@JsonKey(name: 'avatar') required this.avatar});

  factory _$SetAvatarBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetAvatarBodyImplFromJson(json);

  @override
  @JsonKey(name: 'avatar')
  final String avatar;

  @override
  String toString() {
    return 'SetAvatarBody(avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAvatarBodyImpl &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatar);

  /// Create a copy of SetAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAvatarBodyImplCopyWith<_$SetAvatarBodyImpl> get copyWith =>
      __$$SetAvatarBodyImplCopyWithImpl<_$SetAvatarBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetAvatarBodyImplToJson(
      this,
    );
  }
}

abstract class _SetAvatarBody implements SetAvatarBody {
  const factory _SetAvatarBody(
          {@JsonKey(name: 'avatar') required final String avatar}) =
      _$SetAvatarBodyImpl;

  factory _SetAvatarBody.fromJson(Map<String, dynamic> json) =
      _$SetAvatarBodyImpl.fromJson;

  @override
  @JsonKey(name: 'avatar')
  String get avatar;

  /// Create a copy of SetAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetAvatarBodyImplCopyWith<_$SetAvatarBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
