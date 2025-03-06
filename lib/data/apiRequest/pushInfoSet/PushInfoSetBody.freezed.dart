// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PushInfoSetBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PushInfoSetBody _$PushInfoSetBodyFromJson(Map<String, dynamic> json) {
  return _PushInfoSetBody.fromJson(json);
}

/// @nodoc
mixin _$PushInfoSetBody {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushType')
  String get pushType => throw _privateConstructorUsedError;
  @JsonKey(name: 'account')
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'appid')
  int get appid => throw _privateConstructorUsedError;

  /// Serializes this PushInfoSetBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushInfoSetBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushInfoSetBodyCopyWith<PushInfoSetBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushInfoSetBodyCopyWith<$Res> {
  factory $PushInfoSetBodyCopyWith(
          PushInfoSetBody value, $Res Function(PushInfoSetBody) then) =
      _$PushInfoSetBodyCopyWithImpl<$Res, PushInfoSetBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'pushType') String pushType,
      @JsonKey(name: 'account') String account,
      @JsonKey(name: 'appid') int appid});
}

/// @nodoc
class _$PushInfoSetBodyCopyWithImpl<$Res, $Val extends PushInfoSetBody>
    implements $PushInfoSetBodyCopyWith<$Res> {
  _$PushInfoSetBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushInfoSetBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? pushType = null,
    Object? account = null,
    Object? appid = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      pushType: null == pushType
          ? _value.pushType
          : pushType // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      appid: null == appid
          ? _value.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushInfoSetBodyImplCopyWith<$Res>
    implements $PushInfoSetBodyCopyWith<$Res> {
  factory _$$PushInfoSetBodyImplCopyWith(_$PushInfoSetBodyImpl value,
          $Res Function(_$PushInfoSetBodyImpl) then) =
      __$$PushInfoSetBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'pushType') String pushType,
      @JsonKey(name: 'account') String account,
      @JsonKey(name: 'appid') int appid});
}

/// @nodoc
class __$$PushInfoSetBodyImplCopyWithImpl<$Res>
    extends _$PushInfoSetBodyCopyWithImpl<$Res, _$PushInfoSetBodyImpl>
    implements _$$PushInfoSetBodyImplCopyWith<$Res> {
  __$$PushInfoSetBodyImplCopyWithImpl(
      _$PushInfoSetBodyImpl _value, $Res Function(_$PushInfoSetBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushInfoSetBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? pushType = null,
    Object? account = null,
    Object? appid = null,
  }) {
    return _then(_$PushInfoSetBodyImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      pushType: null == pushType
          ? _value.pushType
          : pushType // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      appid: null == appid
          ? _value.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushInfoSetBodyImpl implements _PushInfoSetBody {
  const _$PushInfoSetBodyImpl(
      {@JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'pushType') required this.pushType,
      @JsonKey(name: 'account') required this.account,
      @JsonKey(name: 'appid') required this.appid});

  factory _$PushInfoSetBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushInfoSetBodyImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'pushType')
  final String pushType;
  @override
  @JsonKey(name: 'account')
  final String account;
  @override
  @JsonKey(name: 'appid')
  final int appid;

  @override
  String toString() {
    return 'PushInfoSetBody(token: $token, pushType: $pushType, account: $account, appid: $appid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushInfoSetBodyImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.pushType, pushType) ||
                other.pushType == pushType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.appid, appid) || other.appid == appid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, pushType, account, appid);

  /// Create a copy of PushInfoSetBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushInfoSetBodyImplCopyWith<_$PushInfoSetBodyImpl> get copyWith =>
      __$$PushInfoSetBodyImplCopyWithImpl<_$PushInfoSetBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushInfoSetBodyImplToJson(
      this,
    );
  }
}

abstract class _PushInfoSetBody implements PushInfoSetBody {
  const factory _PushInfoSetBody(
          {@JsonKey(name: 'token') required final String token,
          @JsonKey(name: 'pushType') required final String pushType,
          @JsonKey(name: 'account') required final String account,
          @JsonKey(name: 'appid') required final int appid}) =
      _$PushInfoSetBodyImpl;

  factory _PushInfoSetBody.fromJson(Map<String, dynamic> json) =
      _$PushInfoSetBodyImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'pushType')
  String get pushType;
  @override
  @JsonKey(name: 'account')
  String get account;
  @override
  @JsonKey(name: 'appid')
  int get appid;

  /// Create a copy of PushInfoSetBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushInfoSetBodyImplCopyWith<_$PushInfoSetBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
