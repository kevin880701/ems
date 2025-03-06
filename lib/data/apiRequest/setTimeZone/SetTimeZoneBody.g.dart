// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SetTimeZoneBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetTimeZoneBodyImpl _$$SetTimeZoneBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$SetTimeZoneBodyImpl(
      attrs: json['attrs'] == null
          ? null
          : Attrs.fromJson(json['attrs'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SetTimeZoneBodyImplToJson(
        _$SetTimeZoneBodyImpl instance) =>
    <String, dynamic>{
      'attrs': instance.attrs,
      'name': instance.name,
    };
