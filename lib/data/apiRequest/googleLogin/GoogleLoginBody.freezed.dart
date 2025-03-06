// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GoogleLoginBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleLoginBody _$GoogleLoginBodyFromJson(Map<String, dynamic> json) {
  return _GoogleLoginBody.fromJson(json);
}

/// @nodoc
mixin _$GoogleLoginBody {
  @JsonKey(name: 'account')
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'gUid')
  String get gUid => throw _privateConstructorUsedError;

  /// Serializes this GoogleLoginBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleLoginBodyCopyWith<GoogleLoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleLoginBodyCopyWith<$Res> {
  factory $GoogleLoginBodyCopyWith(
          GoogleLoginBody value, $Res Function(GoogleLoginBody) then) =
      _$GoogleLoginBodyCopyWithImpl<$Res, GoogleLoginBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'gUid') String gUid});
}

/// @nodoc
class _$GoogleLoginBodyCopyWithImpl<$Res, $Val extends GoogleLoginBody>
    implements $GoogleLoginBodyCopyWith<$Res> {
  _$GoogleLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? name = null,
    Object? gUid = null,
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
      gUid: null == gUid
          ? _value.gUid
          : gUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleLoginBodyImplCopyWith<$Res>
    implements $GoogleLoginBodyCopyWith<$Res> {
  factory _$$GoogleLoginBodyImplCopyWith(_$GoogleLoginBodyImpl value,
          $Res Function(_$GoogleLoginBodyImpl) then) =
      __$$GoogleLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'gUid') String gUid});
}

/// @nodoc
class __$$GoogleLoginBodyImplCopyWithImpl<$Res>
    extends _$GoogleLoginBodyCopyWithImpl<$Res, _$GoogleLoginBodyImpl>
    implements _$$GoogleLoginBodyImplCopyWith<$Res> {
  __$$GoogleLoginBodyImplCopyWithImpl(
      _$GoogleLoginBodyImpl _value, $Res Function(_$GoogleLoginBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? name = null,
    Object? gUid = null,
  }) {
    return _then(_$GoogleLoginBodyImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gUid: null == gUid
          ? _value.gUid
          : gUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleLoginBodyImpl implements _GoogleLoginBody {
  const _$GoogleLoginBodyImpl(
      {@JsonKey(name: 'account') required this.account,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'gUid') required this.gUid});

  factory _$GoogleLoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleLoginBodyImplFromJson(json);

  @override
  @JsonKey(name: 'account')
  final String account;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'gUid')
  final String gUid;

  @override
  String toString() {
    return 'GoogleLoginBody(account: $account, name: $name, gUid: $gUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLoginBodyImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gUid, gUid) || other.gUid == gUid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, account, name, gUid);

  /// Create a copy of GoogleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleLoginBodyImplCopyWith<_$GoogleLoginBodyImpl> get copyWith =>
      __$$GoogleLoginBodyImplCopyWithImpl<_$GoogleLoginBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _GoogleLoginBody implements GoogleLoginBody {
  const factory _GoogleLoginBody(
          {@JsonKey(name: 'account') required final String account,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'gUid') required final String gUid}) =
      _$GoogleLoginBodyImpl;

  factory _GoogleLoginBody.fromJson(Map<String, dynamic> json) =
      _$GoogleLoginBodyImpl.fromJson;

  @override
  @JsonKey(name: 'account')
  String get account;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'gUid')
  String get gUid;

  /// Create a copy of GoogleLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleLoginBodyImplCopyWith<_$GoogleLoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
