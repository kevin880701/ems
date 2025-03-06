// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppleCheckResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppleCheckResponseImpl _$$AppleCheckResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppleCheckResponseImpl(
      result: (json['result'] as num).toInt(),
      data: json['data'] as bool,
    );

Map<String, dynamic> _$$AppleCheckResponseImplToJson(
        _$AppleCheckResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };
