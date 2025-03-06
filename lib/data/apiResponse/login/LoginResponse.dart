import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginResponse.freezed.dart';
part 'LoginResponse.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required LoginResponseData data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginResponseData with _$LoginResponseData {
  const factory LoginResponseData({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'org') String? org,
    @JsonKey(name: 'accountType') required int accountType,
    @JsonKey(name: 'uid') String? uid,
  }) = _LoginResponseData;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  /// Clear factory method for creating an empty instance.
  factory LoginResponseData.clear() => const LoginResponseData(
    token: '',
    account: '',
    password: null,
    name: '',
    org: null,
    accountType: 0,
    uid: null,
  );
}
