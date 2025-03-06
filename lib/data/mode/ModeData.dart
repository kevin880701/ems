
class ModeData {
  String modeName;
  String modeDescription;
  String image;
  String? selfModeStartTime;
  String? selfModeEndTime;
  String? peakShavingChargeStart1Time;
  String? peakShavingChargeEnd1Time;
  String? peakShavingDischargeStart1Time;
  String? peakShavingDischargeEnd1Time;
  String? peakShavingChargeStart2Time;
  String? peakShavingChargeEnd2Time;
  String? peakShavingDischargeStart2Time;
  String? peakShavingDischargeEnd2Time;

  ModeData({
    required this.modeName,
    required this.modeDescription,
    required this.image,
    this.selfModeStartTime,
    this.selfModeEndTime,
    this.peakShavingChargeStart1Time,
    this.peakShavingChargeEnd1Time,
    this.peakShavingDischargeStart1Time,
    this.peakShavingDischargeEnd1Time,
    this.peakShavingChargeStart2Time,
    this.peakShavingChargeEnd2Time,
    this.peakShavingDischargeStart2Time,
    this.peakShavingDischargeEnd2Time,
  });

  ModeData copyWith({
    String? modeName,
    String? modeDescription,
    String? image,
    int? selfModeStartIndex,
    int? selfModeEndIndex,
    int? peakShavingChargeStart1Index,
    int? peakShavingChargeEnd1Index,
    int? peakShavingDischargeStart1Index,
    int? peakShavingDischargeEnd1Index,
    int? peakShavingChargeStart2Index,
    int? peakShavingChargeEnd2Index,
  }) {
    return ModeData(
      modeName: modeName ?? this.modeName,
      modeDescription: modeDescription ?? this.modeDescription,
      image: image ?? this.image,
      selfModeStartTime: selfModeStartTime,
      selfModeEndTime: selfModeEndTime,
      peakShavingChargeStart1Time: peakShavingChargeStart1Time,
      peakShavingChargeEnd1Time: peakShavingChargeEnd1Time,
      peakShavingDischargeStart1Time: peakShavingDischargeStart1Time,
      peakShavingDischargeEnd1Time: peakShavingDischargeEnd1Time,
      peakShavingChargeStart2Time: peakShavingChargeStart2Time,
      peakShavingChargeEnd2Time: peakShavingChargeEnd2Time,
    );
  }
}