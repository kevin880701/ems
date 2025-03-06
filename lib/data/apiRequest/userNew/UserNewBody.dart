import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserNewBody.freezed.dart';
part 'UserNewBody.g.dart';

@freezed
class UserNewBody with _$UserNewBody {
  const factory UserNewBody({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'acc') required String acc,
    @JsonKey(name: 'pwd') required String pwd,
  }) = _UserNewBody;

  factory UserNewBody.fromJson(Map<String, dynamic> json) =>
      _$UserNewBodyFromJson(json);
}
