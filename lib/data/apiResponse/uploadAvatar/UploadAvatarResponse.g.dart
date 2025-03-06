// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UploadAvatarResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadAvatarResponseImpl _$$UploadAvatarResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadAvatarResponseImpl(
      result: (json['result'] as num).toInt(),
      data: json['fileid'] as String,
    );

Map<String, dynamic> _$$UploadAvatarResponseImplToJson(
        _$UploadAvatarResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'fileid': instance.data,
    };
