// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EnergyListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyListDataImpl _$$EnergyListDataImplFromJson(Map<String, dynamic> json) =>
    _$EnergyListDataImpl(
      energyList: (json['data'] as List<dynamic>)
          .map((e) => EnergyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnergyListDataImplToJson(
        _$EnergyListDataImpl instance) =>
    <String, dynamic>{
      'data': instance.energyList,
    };

_$EnergyDataImpl _$$EnergyDataImplFromJson(Map<String, dynamic> json) =>
    _$EnergyDataImpl(
      time: json['time'] as String,
      titleList:
          (json['titleList'] as List<dynamic>).map((e) => e as String).toList(),
      valueList: (json['valueList'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$$EnergyDataImplToJson(_$EnergyDataImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'titleList': instance.titleList,
      'valueList': instance.valueList,
    };
