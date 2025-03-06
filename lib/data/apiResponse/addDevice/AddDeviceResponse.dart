import 'package:freezed_annotation/freezed_annotation.dart';

part 'AddDeviceResponse.freezed.dart';
part 'AddDeviceResponse.g.dart';

@freezed
class AddDeviceResponse with _$AddDeviceResponse {
  const factory AddDeviceResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required AddDeviceData data,
  }) = _AddDeviceResponse;

  factory AddDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddDeviceResponseFromJson(json);
}

@freezed
class AddDeviceData with _$AddDeviceData {
  const factory AddDeviceData({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'deviceid') required String deviceid,
  }) = _AddDeviceData;

  factory AddDeviceData.fromJson(Map<String, dynamic> json) =>
      _$AddDeviceDataFromJson(json);
}
