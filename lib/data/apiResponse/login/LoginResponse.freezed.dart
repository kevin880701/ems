// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  LoginResponseData get data => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') LoginResponseData data});

  $LoginResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginResponseData,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResponseDataCopyWith<$Res> get data {
    return $LoginResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') LoginResponseData data});

  @override
  $LoginResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$LoginResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginResponseData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final LoginResponseData data;

  @override
  String toString() {
    return 'LoginResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final LoginResponseData data}) =
      _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  LoginResponseData get data;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) {
  return _LoginResponseData.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseData {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'account')
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'org')
  String? get org => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountType')
  int get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;

  /// Serializes this LoginResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseDataCopyWith<LoginResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseDataCopyWith<$Res> {
  factory $LoginResponseDataCopyWith(
          LoginResponseData value, $Res Function(LoginResponseData) then) =
      _$LoginResponseDataCopyWithImpl<$Res, LoginResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'account') String account,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'org') String? org,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'uid') String? uid});
}

/// @nodoc
class _$LoginResponseDataCopyWithImpl<$Res, $Val extends LoginResponseData>
    implements $LoginResponseDataCopyWith<$Res> {
  _$LoginResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? account = null,
    Object? password = freezed,
    Object? name = null,
    Object? org = freezed,
    Object? accountType = null,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseDataImplCopyWith<$Res>
    implements $LoginResponseDataCopyWith<$Res> {
  factory _$$LoginResponseDataImplCopyWith(_$LoginResponseDataImpl value,
          $Res Function(_$LoginResponseDataImpl) then) =
      __$$LoginResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'account') String account,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'org') String? org,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'uid') String? uid});
}

/// @nodoc
class __$$LoginResponseDataImplCopyWithImpl<$Res>
    extends _$LoginResponseDataCopyWithImpl<$Res, _$LoginResponseDataImpl>
    implements _$$LoginResponseDataImplCopyWith<$Res> {
  __$$LoginResponseDataImplCopyWithImpl(_$LoginResponseDataImpl _value,
      $Res Function(_$LoginResponseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? account = null,
    Object? password = freezed,
    Object? name = null,
    Object? org = freezed,
    Object? accountType = null,
    Object? uid = freezed,
  }) {
    return _then(_$LoginResponseDataImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseDataImpl implements _LoginResponseData {
  const _$LoginResponseDataImpl(
      {@JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'account') required this.account,
      @JsonKey(name: 'password') this.password,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'org') this.org,
      @JsonKey(name: 'accountType') required this.accountType,
      @JsonKey(name: 'uid') this.uid});

  factory _$LoginResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'account')
  final String account;
  @override
  @JsonKey(name: 'password')
  final String? password;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'org')
  final String? org;
  @override
  @JsonKey(name: 'accountType')
  final int accountType;
  @override
  @JsonKey(name: 'uid')
  final String? uid;

  @override
  String toString() {
    return 'LoginResponseData(token: $token, account: $account, password: $password, name: $name, org: $org, accountType: $accountType, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseDataImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, account, password, name, org, accountType, uid);

  /// Create a copy of LoginResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseDataImplCopyWith<_$LoginResponseDataImpl> get copyWith =>
      __$$LoginResponseDataImplCopyWithImpl<_$LoginResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseDataImplToJson(
      this,
    );
  }
}

abstract class _LoginResponseData implements LoginResponseData {
  const factory _LoginResponseData(
      {@JsonKey(name: 'token') required final String token,
      @JsonKey(name: 'account') required final String account,
      @JsonKey(name: 'password') final String? password,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'org') final String? org,
      @JsonKey(name: 'accountType') required final int accountType,
      @JsonKey(name: 'uid') final String? uid}) = _$LoginResponseDataImpl;

  factory _LoginResponseData.fromJson(Map<String, dynamic> json) =
      _$LoginResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'account')
  String get account;
  @override
  @JsonKey(name: 'password')
  String? get password;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'org')
  String? get org;
  @override
  @JsonKey(name: 'accountType')
  int get accountType;
  @override
  @JsonKey(name: 'uid')
  String? get uid;

  /// Create a copy of LoginResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseDataImplCopyWith<_$LoginResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
