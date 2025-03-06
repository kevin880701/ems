// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NodeConfigsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeConfigImpl _$$NodeConfigImplFromJson(Map<String, dynamic> json) =>
    _$NodeConfigImpl(
      ruleType: json['ruleType'] as String,
      name: json['name'] as String,
      rule: json['rule'] as String,
      id: json['id'] as String,
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$$NodeConfigImplToJson(_$NodeConfigImpl instance) =>
    <String, dynamic>{
      'ruleType': instance.ruleType,
      'name': instance.name,
      'rule': instance.rule,
      'id': instance.id,
      'type': instance.type,
    };
