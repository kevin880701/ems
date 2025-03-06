import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserInfoResponse.freezed.dart';
part 'UserInfoResponse.g.dart';

@freezed
class UserInfoResponse with _$UserInfoResponse {
  const factory UserInfoResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required UserInfoData data,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}

@freezed
class UserInfoData with _$UserInfoData {
  const factory UserInfoData({
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'account') String? account,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'org') String? org,
    @JsonKey(name: 'accountType') required int accountType,
    @JsonKey(name: 'attrs') required Map<String, String> attrs,
    @JsonKey(name: 'groups') required List<Group> groups,
    @JsonKey(name: 'pushInfo') required Map<String, dynamic> pushInfo,
  }) = _UserInfoData;

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);
}

@freezed
class Group with _$Group {
  const factory Group({
    @JsonKey(name: 'groupId') required String groupId,
    @JsonKey(name: 'parent') required String parent,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'owner') required String owner,
    @JsonKey(name: 'attrs') required Map<String, dynamic> attrs,
    @JsonKey(name: 'ownerAccount') String? ownerAccount,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
