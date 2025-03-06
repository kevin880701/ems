import 'package:ems_app/data/Params.dart';
import 'package:ems_app/define.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetPeakShavingModeTimeBody.freezed.dart';
part 'SetPeakShavingModeTimeBody.g.dart';

@freezed
class SetPeakShavingModeTimeBody with _$SetPeakShavingModeTimeBody {
  const factory SetPeakShavingModeTimeBody({
    @JsonKey(name: 'M12') required String m12,
    @JsonKey(name: 'M22') String? m22,
  }) = _SetPeakShavingModeTimeBody;

  factory SetPeakShavingModeTimeBody.create(
      String? chargeStart1Time,
      String? chargeEnd1Time,
      String? dischargeStart1Time,
      String? dischargeEnd1Time,
      String? chargeStart2Time,
      String? chargeEnd2Time,
      String? dischargeStart2Time,
      String? dischargeEnd2Time,
      ) {

    String formattedChargeStart1Time = chargeStart1Time ?? "0000";
    String formattedChargeEnd1Time = chargeEnd1Time ?? "0000";
    String formattedDischargeStart1Time = dischargeStart1Time ?? "0000";
    String formattedDischargeEnd1Time = dischargeEnd1Time ?? "0000";

    String formattedChargeStart2Time = chargeStart2Time ?? "0000";
    String formattedChargeEnd2Time = chargeEnd2Time ?? "0000";
    String formattedDischargeStart2Time = dischargeStart2Time ?? "0000";
    String formattedDischargeEnd2Time = dischargeEnd2Time ?? "0000";

    String m12 = formattedChargeStart1Time +
        formattedChargeEnd1Time +
        formattedDischargeStart1Time +
        formattedDischargeEnd1Time;

    String? m22 = (formattedChargeStart2Time +
        formattedChargeEnd2Time +
        formattedDischargeStart2Time +
        formattedDischargeEnd2Time)
        .trim();

    return SetPeakShavingModeTimeBody(
      m12: m12,
      m22: m22 == "000000000000" ? null : m22,
    );
  }

  factory SetPeakShavingModeTimeBody.fromJson(Map<String, dynamic> json) =>
      _$SetPeakShavingModeTimeBodyFromJson(json);
}
