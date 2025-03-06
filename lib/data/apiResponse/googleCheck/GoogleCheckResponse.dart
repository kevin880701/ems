import 'package:freezed_annotation/freezed_annotation.dart';

part 'GoogleCheckResponse.freezed.dart';
part 'GoogleCheckResponse.g.dart';

@freezed
class GoogleCheckResponse with _$GoogleCheckResponse {
  const factory GoogleCheckResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required bool data,
  }) = _GoogleCheckResponse;

  factory GoogleCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleCheckResponseFromJson(json);
}
