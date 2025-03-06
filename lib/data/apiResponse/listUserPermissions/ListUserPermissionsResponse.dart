import 'package:freezed_annotation/freezed_annotation.dart';

part 'ListUserPermissionsResponse.freezed.dart';
part 'ListUserPermissionsResponse.g.dart';

@freezed
class ListUserPermissionsResponse with _$ListUserPermissionsResponse {
  const factory ListUserPermissionsResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required Map<String, Map<String, PermissionInfo>> data,
  }) = _ListUserPermissionsResponse;

  factory ListUserPermissionsResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonData = json['data'] ?? {};
    Map<String, Map<String, PermissionInfo>> parsedData = {};

    jsonData.forEach((userId, permissions) {
      Map<String, PermissionInfo> parsedPermissions = {};
      permissions.forEach((devId, permissionInfo) {
        parsedPermissions[devId] = PermissionInfo.fromJson(permissionInfo);
      });
      parsedData[userId] = parsedPermissions;
    });

    return ListUserPermissionsResponse(
      result: json['result'] ?? 0,
      data: parsedData,
    );
  }
}

@freezed
class PermissionInfo with _$PermissionInfo {
  const factory PermissionInfo({
    @JsonKey(name: 'permission') required int permission,
    @JsonKey(name: 'ruleFlag') required int ruleFlag,
  }) = _PermissionInfo;

  factory PermissionInfo.fromJson(Map<String, dynamic> json) =>
      _$PermissionInfoFromJson(json);
}
