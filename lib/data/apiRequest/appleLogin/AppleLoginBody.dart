import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppleLoginBody.freezed.dart';
part 'AppleLoginBody.g.dart';

@freezed
class AppleLoginBody with _$AppleLoginBody {
  const factory AppleLoginBody({
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'aUid') required String aUid,
  }) = _AppleLoginBody;

  factory AppleLoginBody.fromJson(Map<String, dynamic> json) =>
      _$AppleLoginBodyFromJson(json);
}
