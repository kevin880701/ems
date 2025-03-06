// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfoResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoResponseImpl _$$UserInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoResponseImpl(
      result: (json['result'] as num).toInt(),
      data: UserInfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoResponseImplToJson(
        _$UserInfoResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

_$UserInfoDataImpl _$$UserInfoDataImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoDataImpl(
      uid: json['uid'] as String?,
      account: json['account'] as String?,
      name: json['name'] as String?,
      org: json['org'] as String?,
      accountType: (json['accountType'] as num).toInt(),
      attrs: Map<String, String>.from(json['attrs'] as Map),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      pushInfo: json['pushInfo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UserInfoDataImplToJson(_$UserInfoDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'account': instance.account,
      'name': instance.name,
      'org': instance.org,
      'accountType': instance.accountType,
      'attrs': instance.attrs,
      'groups': instance.groups,
      'pushInfo': instance.pushInfo,
    };

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      groupId: json['groupId'] as String,
      parent: json['parent'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
      attrs: json['attrs'] as Map<String, dynamic>,
      ownerAccount: json['ownerAccount'] as String?,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'parent': instance.parent,
      'name': instance.name,
      'owner': instance.owner,
      'attrs': instance.attrs,
      'ownerAccount': instance.ownerAccount,
    };
