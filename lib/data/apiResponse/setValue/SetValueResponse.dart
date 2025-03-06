import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetValueResponse.freezed.dart';
part 'SetValueResponse.g.dart';

@freezed
class SetValueResponse with _$SetValueResponse {
  const factory SetValueResponse({
    @JsonKey(name: 'result') required int result,
  }) = _SetValueResponse;

  factory SetValueResponse.fromJson(Map<String, dynamic> json) =>
      _$SetValueResponseFromJson(json);
}
