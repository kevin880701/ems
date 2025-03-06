import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserDetailInfoResponse.freezed.dart';
part 'UserDetailInfoResponse.g.dart';

@freezed
class UserDetailInfoResponse with _$UserDetailInfoResponse {
  const factory UserDetailInfoResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required dynamic data,
  }) = _UserDetailInfoResponse;

  factory UserDetailInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailInfoResponseFromJson(json);
}

@freezed
class UserDetailInfo with _$UserDetailInfo {
  const factory UserDetailInfo({
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'org') required String org,
    @JsonKey(name: 'accountType') required int accountType,
    @JsonKey(name: 'attrs') required Map<String, dynamic> attrs,
    @JsonKey(name: 'groups') required List<Group> groups,
    @JsonKey(name: 'pushInfo') required Map<String, dynamic> pushInfo,
  }) = _UserDetailInfo;

  factory UserDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$UserDetailInfoFromJson(json);
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
