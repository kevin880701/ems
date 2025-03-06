import 'package:freezed_annotation/freezed_annotation.dart';

part 'AddDevNodeResponse.freezed.dart';
part 'AddDevNodeResponse.g.dart';

@freezed
class AddDevNodeResponse with _$AddDevNodeResponse {
  const factory AddDevNodeResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required AddDevNodeData data,
  }) = _AddDevNodeResponse;

  factory AddDevNodeResponse.fromJson(Map<String, dynamic> json) =>
      _$AddDevNodeResponseFromJson(json);
}

@freezed
class AddDevNodeData with _$AddDevNodeData {
  const factory AddDevNodeData({
    @JsonKey(name: 'devid') required String devId,
  }) = _AddDevNodeData;

  factory AddDevNodeData.fromJson(Map<String, dynamic> json) =>
      _$AddDevNodeDataFromJson(json);
}
