// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListUserPermissionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionInfoImpl _$$PermissionInfoImplFromJson(Map<String, dynamic> json) =>
    _$PermissionInfoImpl(
      permission: (json['permission'] as num).toInt(),
      ruleFlag: (json['ruleFlag'] as num).toInt(),
    );

Map<String, dynamic> _$$PermissionInfoImplToJson(
        _$PermissionInfoImpl instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'ruleFlag': instance.ruleFlag,
    };
