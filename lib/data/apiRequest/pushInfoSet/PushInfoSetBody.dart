import 'package:freezed_annotation/freezed_annotation.dart';

part 'PushInfoSetBody.freezed.dart';
part 'PushInfoSetBody.g.dart';

@freezed
class PushInfoSetBody with _$PushInfoSetBody {
  const factory PushInfoSetBody({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'pushType') required String pushType,
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'appid') required int appid,
  }) = _PushInfoSetBody;

  factory PushInfoSetBody.fromJson(Map<String, dynamic> json) =>
      _$PushInfoSetBodyFromJson(json);
}
