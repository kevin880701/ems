// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviceListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceListResponseImpl _$$DeviceListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceListResponseImpl(
      result: (json['result'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DeviceListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DeviceListResponseImplToJson(
        _$DeviceListResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

_$DeviceListDataImpl _$$DeviceListDataImplFromJson(Map<String, dynamic> json) =>
    _$DeviceListDataImpl(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      devId: json['devId'] as String,
      name: json['name'] as String,
      modelId: (json['modelId'] as num).toInt(),
      modelName: json['modelName'] as String,
      owner: json['owner'] as String?,
      activeappid: (json['activeappid'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      profiles: json['profiles'] as List<dynamic>,
      attrs: json['attrs'] == null
          ? null
          : Attrs.fromJson(json['attrs'] as Map<String, dynamic>),
      vals: valsFromJson(json['vals']),
    );

Map<String, dynamic> _$$DeviceListDataImplToJson(
        _$DeviceListDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'devId': instance.devId,
      'name': instance.name,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'owner': instance.owner,
      'activeappid': instance.activeappid,
      'status': instance.status,
      'profiles': instance.profiles,
      'attrs': instance.attrs,
      'vals': instance.vals,
    };
