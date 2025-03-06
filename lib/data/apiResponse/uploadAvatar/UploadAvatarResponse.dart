import 'package:freezed_annotation/freezed_annotation.dart';

part 'UploadAvatarResponse.freezed.dart';
part 'UploadAvatarResponse.g.dart';

@freezed
class UploadAvatarResponse with _$UploadAvatarResponse {
  const factory UploadAvatarResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'fileid') required String data,
  }) = _UploadAvatarResponse;

  factory UploadAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadAvatarResponseFromJson(json);
}
