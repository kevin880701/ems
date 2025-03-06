// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChangeUserNameBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangeUserNameBody _$ChangeUserNameBodyFromJson(Map<String, dynamic> json) {
  return _ChangeUserNameBody.fromJson(json);
}

/// @nodoc
mixin _$ChangeUserNameBody {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ChangeUserNameBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangeUserNameBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeUserNameBodyCopyWith<ChangeUserNameBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeUserNameBodyCopyWith<$Res> {
  factory $ChangeUserNameBodyCopyWith(
          ChangeUserNameBody value, $Res Function(ChangeUserNameBody) then) =
      _$ChangeUserNameBodyCopyWithImpl<$Res, ChangeUserNameBody>;
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$ChangeUserNameBodyCopyWithImpl<$Res, $Val extends ChangeUserNameBody>
    implements $ChangeUserNameBodyCopyWith<$Res> {
  _$ChangeUserNameBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeUserNameBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeUserNameBodyImplCopyWith<$Res>
    implements $ChangeUserNameBodyCopyWith<$Res> {
  factory _$$ChangeUserNameBodyImplCopyWith(_$ChangeUserNameBodyImpl value,
          $Res Function(_$ChangeUserNameBodyImpl) then) =
      __$$ChangeUserNameBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$ChangeUserNameBodyImplCopyWithImpl<$Res>
    extends _$ChangeUserNameBodyCopyWithImpl<$Res, _$ChangeUserNameBodyImpl>
    implements _$$ChangeUserNameBodyImplCopyWith<$Res> {
  __$$ChangeUserNameBodyImplCopyWithImpl(_$ChangeUserNameBodyImpl _value,
      $Res Function(_$ChangeUserNameBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeUserNameBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ChangeUserNameBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangeUserNameBodyImpl implements _ChangeUserNameBody {
  const _$ChangeUserNameBodyImpl({@JsonKey(name: 'name') required this.name});

  factory _$ChangeUserNameBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeUserNameBodyImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'ChangeUserNameBody(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeUserNameBodyImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of ChangeUserNameBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeUserNameBodyImplCopyWith<_$ChangeUserNameBodyImpl> get copyWith =>
      __$$ChangeUserNameBodyImplCopyWithImpl<_$ChangeUserNameBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeUserNameBodyImplToJson(
      this,
    );
  }
}

abstract class _ChangeUserNameBody implements ChangeUserNameBody {
  const factory _ChangeUserNameBody(
          {@JsonKey(name: 'name') required final String name}) =
      _$ChangeUserNameBodyImpl;

  factory _ChangeUserNameBody.fromJson(Map<String, dynamic> json) =
      _$ChangeUserNameBodyImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of ChangeUserNameBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeUserNameBodyImplCopyWith<_$ChangeUserNameBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
