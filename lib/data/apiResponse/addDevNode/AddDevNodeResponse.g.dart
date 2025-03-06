// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddDevNodeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddDevNodeResponseImpl _$$AddDevNodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AddDevNodeResponseImpl(
      result: (json['result'] as num).toInt(),
      data: AddDevNodeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddDevNodeResponseImplToJson(
        _$AddDevNodeResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

_$AddDevNodeDataImpl _$$AddDevNodeDataImplFromJson(Map<String, dynamic> json) =>
    _$AddDevNodeDataImpl(
      devId: json['devid'] as String,
    );

Map<String, dynamic> _$$AddDevNodeDataImplToJson(
        _$AddDevNodeDataImpl instance) =>
    <String, dynamic>{
      'devid': instance.devId,
    };
