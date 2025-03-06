import 'package:freezed_annotation/freezed_annotation.dart';

part 'GoogleLoginBody.freezed.dart';
part 'GoogleLoginBody.g.dart';

@freezed
class GoogleLoginBody with _$GoogleLoginBody {
  const factory GoogleLoginBody({
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'gUid') required String gUid,
  }) = _GoogleLoginBody;

  factory GoogleLoginBody.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginBodyFromJson(json);
}
