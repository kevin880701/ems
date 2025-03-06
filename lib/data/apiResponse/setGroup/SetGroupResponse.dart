import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetGroupResponse.freezed.dart';
part 'SetGroupResponse.g.dart';

@freezed
class SetGroupResponse with _$SetGroupResponse {
  const factory SetGroupResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required dynamic data,
  }) = _SetGroupResponse;

  factory SetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$SetGroupResponseFromJson(json);
}
