import 'package:freezed_annotation/freezed_annotation.dart';

part 'SendPeakShavingModeCmdBody.freezed.dart';
part 'SendPeakShavingModeCmdBody.g.dart';

@freezed
class SendPeakShavingModeCmdBody with _$SendPeakShavingModeCmdBody {
  const factory SendPeakShavingModeCmdBody({
    @JsonKey(name: 'M11') required String m11,
    @JsonKey(name: 'M21') String? m21,
  }) = _SendPeakShavingModeCmdBody;

  factory SendPeakShavingModeCmdBody.create() {
    return SendPeakShavingModeCmdBody(
      m11: "1",
      m21: "1",
    );
  }

  factory SendPeakShavingModeCmdBody.fromJson(Map<String, dynamic> json) =>
      _$SendPeakShavingModeCmdBodyFromJson(json);
}
