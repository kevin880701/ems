// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GoogleCheckResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoogleCheckResponseImpl _$$GoogleCheckResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GoogleCheckResponseImpl(
      result: (json['result'] as num).toInt(),
      data: json['data'] as bool,
    );

Map<String, dynamic> _$$GoogleCheckResponseImplToJson(
        _$GoogleCheckResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };
