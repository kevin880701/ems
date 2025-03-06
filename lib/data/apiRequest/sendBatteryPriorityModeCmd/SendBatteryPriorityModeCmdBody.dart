import 'package:freezed_annotation/freezed_annotation.dart';

part 'SendBatteryPriorityModeCmdBody.freezed.dart';
part 'SendBatteryPriorityModeCmdBody.g.dart';

@freezed
class SendBatteryPriorityModeCmdBody with _$SendBatteryPriorityModeCmdBody {
  const factory SendBatteryPriorityModeCmdBody({
    @JsonKey(name: 'S8') required String s8,
  }) = _SendBatteryPriorityModeCmdBody;

  factory SendBatteryPriorityModeCmdBody.fromJson(Map<String, dynamic> json) =>
      _$SendBatteryPriorityModeCmdBodyFromJson(json);
}
