import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginBody.freezed.dart';
part 'LoginBody.g.dart';

@freezed
class LoginBody with _$LoginBody {
  const factory LoginBody({
    @JsonKey(name: 'acc') required String acc,
    @JsonKey(name: 'pwd') required String pwd,
  }) = _LoginBody;

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);
}
