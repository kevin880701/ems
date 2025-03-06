import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetAvatarBody.freezed.dart';
part 'SetAvatarBody.g.dart';

@freezed
class SetAvatarBody with _$SetAvatarBody {
  const factory SetAvatarBody({
    @JsonKey(name: 'avatar') required String avatar,
  }) = _SetAvatarBody;

  factory SetAvatarBody.fromJson(Map<String, dynamic> json) =>
      _$SetAvatarBodyFromJson(json);
}
