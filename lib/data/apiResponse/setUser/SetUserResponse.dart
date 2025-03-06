import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetUserResponse.freezed.dart';
part 'SetUserResponse.g.dart';

@freezed
class SetUserResponse with _$SetUserResponse {
  const factory SetUserResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required dynamic data,
  }) = _SetUserResponse;

  factory SetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserResponseFromJson(json);
}
