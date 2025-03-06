import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppleCheckResponse.freezed.dart';
part 'AppleCheckResponse.g.dart';

@freezed
class AppleCheckResponse with _$AppleCheckResponse {
  const factory AppleCheckResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required bool data,
  }) = _AppleCheckResponse;

  factory AppleCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$AppleCheckResponseFromJson(json);
}
