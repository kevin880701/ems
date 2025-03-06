// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeleteUserResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteUserResponseImpl _$$DeleteUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteUserResponseImpl(
      result: (json['result'] as num).toInt(),
      data: json['data'] as bool,
    );

Map<String, dynamic> _$$DeleteUserResponseImplToJson(
        _$DeleteUserResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };
