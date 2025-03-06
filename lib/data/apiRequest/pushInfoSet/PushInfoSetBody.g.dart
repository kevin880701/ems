// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PushInfoSetBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushInfoSetBodyImpl _$$PushInfoSetBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$PushInfoSetBodyImpl(
      token: json['token'] as String,
      pushType: json['pushType'] as String,
      account: json['account'] as String,
      appid: (json['appid'] as num).toInt(),
    );

Map<String, dynamic> _$$PushInfoSetBodyImplToJson(
        _$PushInfoSetBodyImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'pushType': instance.pushType,
      'account': instance.account,
      'appid': instance.appid,
    };
