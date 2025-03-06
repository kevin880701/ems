import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UploadAvatarBody.freezed.dart';
part 'UploadAvatarBody.g.dart';

@freezed
class UploadAvatarBody with _$UploadAvatarBody {
  const factory UploadAvatarBody({
    @JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson) required File file1,
    @JsonKey(name: 'attrs') required Map<String, dynamic> attrs,
  }) = _UploadAvatarBody;

  factory UploadAvatarBody.fromJson(Map<String, dynamic> json) =>
      _$UploadAvatarBodyFromJson(json);
}

File _fileFromJson(String path) => File(path);
String _fileToJson(File file) => file.path;


extension UploadAvatarBodyExtension on UploadAvatarBody {
  FormData toFormData() {
    return FormData.fromMap({
      'File1': MultipartFile.fromFileSync(
        file1.path,
        filename: file1.uri.pathSegments.last,
      ),
      'attrs': attrs.toString(),
    });
  }
}
