// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryValueStatisticsParams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryValueStatisticsParamsImpl _$$HistoryValueStatisticsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryValueStatisticsParamsImpl(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      fields: json['fields'] as String,
      interval: (json['interval'] as num).toInt(),
      titles: json['titles'] as String,
    );

Map<String, dynamic> _$$HistoryValueStatisticsParamsImplToJson(
        _$HistoryValueStatisticsParamsImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fields': instance.fields,
      'interval': instance.interval,
      'titles': instance.titles,
    };
