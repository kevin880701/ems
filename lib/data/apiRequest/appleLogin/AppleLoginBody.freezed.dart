// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AppleLoginBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppleLoginBody _$AppleLoginBodyFromJson(Map<String, dynamic> json) {
  return _AppleLoginBody.fromJson(json);
}

/// @nodoc
mixin _$AppleLoginBody {
  @JsonKey(name: 'account')
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'aUid')
  String get aUid => throw _privateConstructorUsedError;

  /// Serializes this AppleLoginBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppleLoginBodyCopyWith<AppleLoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleLoginBodyCopyWith<$Res> {
  factory $AppleLoginBodyCopyWith(
          AppleLoginBody value, $Res Function(AppleLoginBody) then) =
      _$AppleLoginBodyCopyWithImpl<$Res, AppleLoginBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'aUid') String aUid});
}

/// @nodoc
class _$AppleLoginBodyCopyWithImpl<$Res, $Val extends AppleLoginBody>
    implements $AppleLoginBodyCopyWith<$Res> {
  _$AppleLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? name = null,
    Object? aUid = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aUid: null == aUid
          ? _value.aUid
          : aUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppleLoginBodyImplCopyWith<$Res>
    implements $AppleLoginBodyCopyWith<$Res> {
  factory _$$AppleLoginBodyImplCopyWith(_$AppleLoginBodyImpl value,
          $Res Function(_$AppleLoginBodyImpl) then) =
      __$$AppleLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'aUid') String aUid});
}

/// @nodoc
class __$$AppleLoginBodyImplCopyWithImpl<$Res>
    extends _$AppleLoginBodyCopyWithImpl<$Res, _$AppleLoginBodyImpl>
    implements _$$AppleLoginBodyImplCopyWith<$Res> {
  __$$AppleLoginBodyImplCopyWithImpl(
      _$AppleLoginBodyImpl _value, $Res Function(_$AppleLoginBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? name = null,
    Object? aUid = null,
  }) {
    return _then(_$AppleLoginBodyImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aUid: null == aUid
          ? _value.aUid
          : aUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleLoginBodyImpl implements _AppleLoginBody {
  const _$AppleLoginBodyImpl(
      {@JsonKey(name: 'account') required this.account,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'aUid') required this.aUid});

  factory _$AppleLoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleLoginBodyImplFromJson(json);

  @override
  @JsonKey(name: 'account')
  final String account;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'aUid')
  final String aUid;

  @override
  String toString() {
    return 'AppleLoginBody(account: $account, name: $name, aUid: $aUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleLoginBodyImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aUid, aUid) || other.aUid == aUid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, account, name, aUid);

  /// Create a copy of AppleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleLoginBodyImplCopyWith<_$AppleLoginBodyImpl> get copyWith =>
      __$$AppleLoginBodyImplCopyWithImpl<_$AppleLoginBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _AppleLoginBody implements AppleLoginBody {
  const factory _AppleLoginBody(
          {@JsonKey(name: 'account') required final String account,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'aUid') required final String aUid}) =
      _$AppleLoginBodyImpl;

  factory _AppleLoginBody.fromJson(Map<String, dynamic> json) =
      _$AppleLoginBodyImpl.fromJson;

  @override
  @JsonKey(name: 'account')
  String get account;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'aUid')
  String get aUid;

  /// Create a copy of AppleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppleLoginBodyImplCopyWith<_$AppleLoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
