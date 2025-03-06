// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      result: (json['result'] as num).toInt(),
      data: LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

_$LoginResponseDataImpl _$$LoginResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseDataImpl(
      token: json['token'] as String,
      account: json['account'] as String,
      password: json['password'] as String?,
      name: json['name'] as String,
      org: json['org'] as String?,
      accountType: (json['accountType'] as num).toInt(),
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$$LoginResponseDataImplToJson(
        _$LoginResponseDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'account': instance.account,
      'password': instance.password,
      'name': instance.name,
      'org': instance.org,
      'accountType': instance.accountType,
      'uid': instance.uid,
    };
