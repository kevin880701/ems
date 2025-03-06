// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UploadAvatarBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadAvatarBodyImpl _$$UploadAvatarBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadAvatarBodyImpl(
      file1: _fileFromJson(json['File1'] as String),
      attrs: json['attrs'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UploadAvatarBodyImplToJson(
        _$UploadAvatarBodyImpl instance) =>
    <String, dynamic>{
      'File1': _fileToJson(instance.file1),
      'attrs': instance.attrs,
    };
