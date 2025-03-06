import 'package:freezed_annotation/freezed_annotation.dart';

part 'DeleteUserResponse.freezed.dart';
part 'DeleteUserResponse.g.dart';

@freezed
class DeleteUserResponse with _$DeleteUserResponse {
  const factory DeleteUserResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required bool data,
  }) = _DeleteUserResponse;

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}
