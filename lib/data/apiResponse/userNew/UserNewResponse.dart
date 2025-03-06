import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserNewResponse.freezed.dart';
part 'UserNewResponse.g.dart';

@freezed
class UserNewResponse with _$UserNewResponse {
  const factory UserNewResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required dynamic data,
  }) = _UserNewResponse;

  factory UserNewResponse.fromJson(Map<String, dynamic> json) =>
      _$UserNewResponseFromJson(json);
}
