// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeleteUserParams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteUserParamsImpl _$$DeleteUserParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserParamsImpl(
      account: json['account'] as String,
      accountType: (json['accountType'] as num).toInt(),
      org: json['org'] as String?,
    );

Map<String, dynamic> _$$DeleteUserParamsImplToJson(
        _$DeleteUserParamsImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'accountType': instance.accountType,
      'org': instance.org,
    };
