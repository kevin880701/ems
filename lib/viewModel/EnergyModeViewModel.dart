
import 'package:ems_app/data/apiRequest/sendBatteryPriorityModeCmd/SendBatteryPriorityModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendPeakShavingModeCmd/SendPeakShavingModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendSelfUseModeCmd/SendSelfUseModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/setPeakShavingModeTime/SetPeakShavingModeTimeBody.dart';
import 'package:ems_app/data/apiRequest/setSelfUseModeTime/SetSelfUseModeTimeBody.dart';
import 'package:ems_app/data/apiResponse/deviceList/DeviceListResponse.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/repository/CommandRepository.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import '../data/Params.dart';
import '../data/mode/ModeData.dart';

class EnergyModeViewModel extends ChangeNotifier {
  EnergyModeViewModel._();

  static final EnergyModeViewModel instance = EnergyModeViewModel._();

  CommandRepository commandRepository = CommandRepository.instance;

  ModeData modeData = ModeData(
    modeName: AppTexts.batteryPriorityMode,
    modeDescription: AppTexts.batteryPriorityModeSubTitle,
    image: 'assets/images/model3.png',
  );

  ///
  /// 根據傳入的modeValue設置能源模式和相關時間。
  ///   要設置的能源模式的key為reqAndInfo3044，0表示自發自用模式，1表示削峰填谷模式，2表示電池優先優先模式
  ///
  /// 參數：
  ///   response: 打API取回的資料，
  ///
  /// 返回值：
  ///   無。
  ///
  void setEnergyMode(DeviceListData response) {
    // 當前模式點位
    int currentMode = response.vals?.reqAndInfo3044.stringToInt() ?? 0;
    // 自發自用點位
    String reqAndInfo3317 = response.vals?.reqAndInfo3317 ?? '';
    String reqAndInfo3318 = response.vals?.reqAndInfo3318 ?? '';
    String? selfModeStarTime = formatTime(reqAndInfo3317, 0, 4);
    String? selfModeEndTime = formatTime(reqAndInfo3318, 0, 4);
    // 削峰填谷點位，時間格式為充電開始結束+放電開始結束時間：HHMMHHMMHHMMHHMM
    String reqAndInfo3160 = response.vals?.reqAndInfo3160 ?? ''; // 第一組時間
    String? peakShavingChargeStart1Time = formatTime(reqAndInfo3160, 0, 4,);
    String? peakShavingChargeEnd1Time = formatTime(reqAndInfo3160, 4, 8,);
    String? peakShavingDischargeStart1Time = formatTime(reqAndInfo3160, 8, 12,);
    String? peakShavingDischargeEnd1Time = formatTime(reqAndInfo3160, 12, 16,);

    String reqAndInfo3168 = response.vals?.reqAndInfo3168 ?? ''; // 第二組時間

    String? peakShavingChargeStart2Time = "";
    String? peakShavingChargeEnd2Time = "";
    String? peakShavingDischargeStart2Time = "";
    String? peakShavingDischargeEnd2Time = "";
    if(response.vals?.reqAndInfo3168 != "0000000000000000"){
      peakShavingChargeStart2Time = formatTime(reqAndInfo3168, 0, 4);
      peakShavingChargeEnd2Time = formatTime(reqAndInfo3168, 4, 8);
      peakShavingDischargeStart2Time = formatTime(reqAndInfo3168, 8, 12);
      peakShavingDischargeEnd2Time = formatTime(reqAndInfo3168, 12, 16);
    }
    modeData
      ..selfModeStartTime = selfModeStarTime
      ..selfModeEndTime = selfModeEndTime
      ..peakShavingChargeStart1Time = peakShavingChargeStart1Time
      ..peakShavingChargeEnd1Time = peakShavingChargeEnd1Time
      ..peakShavingDischargeStart1Time = peakShavingDischargeStart1Time
      ..peakShavingDischargeEnd1Time = peakShavingDischargeEnd1Time
      ..peakShavingChargeStart2Time = (peakShavingChargeStart2Time != null && peakShavingChargeStart2Time.isNotEmpty)
          ? peakShavingChargeStart2Time
          : null
      ..peakShavingChargeEnd2Time = (peakShavingChargeEnd2Time != null && peakShavingChargeEnd2Time.isNotEmpty)
          ? peakShavingChargeEnd2Time
          : null
      ..peakShavingDischargeStart2Time = (peakShavingDischargeStart2Time != null && peakShavingDischargeStart2Time.isNotEmpty)
          ? peakShavingDischargeStart2Time
          : null
      ..peakShavingDischargeEnd2Time = (peakShavingDischargeEnd2Time != null && peakShavingDischargeEnd2Time.isNotEmpty)
          ? peakShavingDischargeEnd2Time
          : null;

    switch (currentMode) {
      case 0:
        modeData..modeName = AppTexts.selfMode
            ..modeDescription = AppTexts.selfModeSubTitle
            ..image = 'assets/images/model1.png';
        break;
      case 1:
        modeData
          ..modeName = AppTexts.peakShavingMode
          ..modeDescription = AppTexts.peakShavingModeSubTitle
          ..image = 'assets/images/model2.png';
        break;
      case 2:
        modeData
          ..modeName = AppTexts.batteryPriorityMode
          ..modeDescription = AppTexts.batteryPriorityModeSubTitle
          ..image = 'assets/images/model3.png';
        break;
    }
    notifyListeners(); // 通知監聽者數據發生了變化
  }

  void setModeData(String type) {
    if (type == AppTexts.batteryPriorityMode) {
      modeData
        ..modeName = AppTexts.batteryPriorityMode
        ..modeDescription = AppTexts.batteryPriorityModeSubTitle
        ..image = 'assets/images/model3.png';
    } else if (type == AppTexts.selfMode) {
      modeData..modeName = AppTexts.selfMode
        ..modeDescription = AppTexts.selfModeSubTitle
        ..image = 'assets/images/model1.png';
    } else if (type == AppTexts.peakShavingMode) {
      modeData
        ..modeName = AppTexts.peakShavingMode
        ..modeDescription = AppTexts.peakShavingModeSubTitle
        ..image = 'assets/images/model2.png';
    }
    notifyListeners(); // 通知監聽者數據發生了變化
  }

  Future<bool> sendSelfUseModeCmd(SendSelfUseModeCmdBody body) async {
    bool? tempData = await commandRepository.sendSelfUseModeCmd(body);
    if (tempData != null) {
      // 通知監聽者數據發生了變化
      notifyListeners();
      return tempData;
    } else {
      return false;
    }
  }

  Future<bool> sendBatteryPriorityModeCmd(SendBatteryPriorityModeCmdBody sendBatteryPriorityModeCmdBody) async {
    bool? tempData = await commandRepository.sendBatteryPriorityModeCmd(sendBatteryPriorityModeCmdBody);
    if (tempData != null) {
      // 通知監聽者數據發生了變化
      notifyListeners();
      return tempData;
    } else {
      return false;
    }
  }

  Future<bool> sendPeakShavingModeCmd(SendPeakShavingModeCmdBody body) async {
    bool? tempData = await commandRepository.sendPeakShavingModeCmd(body);
    if (tempData != null) {
      // 通知監聽者數據發生了變化
      notifyListeners();
      return tempData;
    } else {
      return false;
    }
  }

  Future<bool> setSelfUseModeTime(SetSelfUseModeTimeBody body) async {
    bool? tempData = await commandRepository.setSelfUseModeTime(body);
    if (tempData != null) {
      // 通知監聽者數據發生了變化
      notifyListeners();
      return tempData;
    } else {
      return false;
    }
  }

  Future<bool> setPeakShavingModeTime(SetPeakShavingModeTimeBody body) async {
    bool? tempData = await commandRepository.setPeakShavingModeTime(body);
    if (tempData != null) {
      // 通知監聽者數據發生了變化
      notifyListeners();
      return tempData;
    } else {
      return false;
    }
  }
}
String? formatTime(String input, int start, int end) {
  if (input == null || input.length < end || start >= end) {
    return null;
  }

  String substring = input.substring(start, end);

  if (substring.length != 4) {
    return null;
  }

  return "${substring.substring(0, 2)}${substring.substring(2, 4)}";
}
