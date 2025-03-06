import 'package:freezed_annotation/freezed_annotation.dart';

part 'SendSelfUseModeCmdBody.freezed.dart';
part 'SendSelfUseModeCmdBody.g.dart';

@freezed
class SendSelfUseModeCmdBody with _$SendSelfUseModeCmdBody {
  const factory SendSelfUseModeCmdBody({
    @JsonKey(name: 'M31') required String m31,
    @JsonKey(name: 'M32') required String m32,
    @JsonKey(name: 'M35') required String m35,
  }) = _SendSelfUseModeCmdBody;

  factory SendSelfUseModeCmdBody.create() {
    return SendSelfUseModeCmdBody(
      m31: '0',
      m32: '1',
      m35: '100',
    );
  }

  factory SendSelfUseModeCmdBody.fromJson(Map<String, dynamic> json) =>
      _$SendSelfUseModeCmdBodyFromJson(json);
}
