// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddDevNodeParams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddDevNodeParamsImpl _$$AddDevNodeParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddDevNodeParamsImpl(
      devid: json['devid'] as String,
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => NodeConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AddDevNodeParamsImplToJson(
        _$AddDevNodeParamsImpl instance) =>
    <String, dynamic>{
      'devid': instance.devid,
      'nodes': instance.nodes,
    };
