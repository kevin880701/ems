import 'package:ems_app/data/apiResponse/attrs/Attrs.dart';
import 'package:ems_app/data/apiResponse/node/Node.dart';
import 'package:ems_app/data/apiResponse/vals/Vals.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'DeviceListResponse.freezed.dart';
part 'DeviceListResponse.g.dart';

@freezed
class DeviceListResponse with _$DeviceListResponse {
  const factory DeviceListResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required List<DeviceListData> data,
  }) = _DeviceListResponse;

  factory DeviceListResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceListResponseFromJson(json);
}

@freezed
class DeviceListData with _$DeviceListData {
  const factory DeviceListData({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'devId') required String devId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'modelId') required int modelId,
    @JsonKey(name: 'modelName') required String modelName,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'activeappid') required int activeappid,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'profiles') required List<dynamic> profiles,
    @JsonKey(name: 'attrs') Attrs? attrs,
    @JsonKey(name: 'vals', fromJson: valsFromJson) Vals? vals,
  }) = _DeviceListData;

  factory DeviceListData.fromJson(Map<String, dynamic> json) =>
      _$DeviceListDataFromJson(json);
}
