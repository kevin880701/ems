// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddDeviceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddDeviceResponseImpl _$$AddDeviceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AddDeviceResponseImpl(
      result: (json['result'] as num).toInt(),
      data: AddDeviceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddDeviceResponseImplToJson(
        _$AddDeviceResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

_$AddDeviceDataImpl _$$AddDeviceDataImplFromJson(Map<String, dynamic> json) =>
    _$AddDeviceDataImpl(
      id: json['id'] as String,
      deviceid: json['deviceid'] as String,
    );

Map<String, dynamic> _$$AddDeviceDataImplToJson(_$AddDeviceDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceid': instance.deviceid,
    };
