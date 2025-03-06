// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      devid: json['devid'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: (json['type'] as num).toInt(),
      val: json['val'] as String,
      data: json['data'] as Map<String, dynamic>,
      attrs: json['attrs'] as Map<String, dynamic>,
      ruleType: json['ruleType'] as String,
      rule: json['rule'] as String,
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'devid': instance.devid,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'val': instance.val,
      'data': instance.data,
      'attrs': instance.attrs,
      'ruleType': instance.ruleType,
      'rule': instance.rule,
    };
