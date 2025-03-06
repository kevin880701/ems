import 'package:flutter/cupertino.dart';
import '../data/personal/SystemSettingData.dart';
import '../resources/app_texts.dart';

class SettingViewModel extends ChangeNotifier {

  SettingViewModel._();

  static final SettingViewModel instance = SettingViewModel._();

  bool isBiometricLoginOpen = false;

  Map<String, SystemSettingData> systemSettingDataMap = {
    // AppTexts.notificationSetting:
    // SystemSettingData(title: AppTexts.notificationSetting, settingPage: "/notificationSetting", systemSettingItems: [
    //   SystemSettingItem(subTitle: AppTexts.deviceFailureAlarm, isShowType: 0, isOpening: true),
    //   SystemSettingItem(subTitle: AppTexts.deviceAbnormalityAlarm, isShowType: 0, isOpening: false),
    //   SystemSettingItem(subTitle: AppTexts.lowBatteryAlarm, isShowType: 0, isOpening: true),
    //   SystemSettingItem(subTitle: AppTexts.modeSwitchNotification, isShowType: 0, isOpening: true),
    // ]),
    // AppTexts.privacySettings:
    // SystemSettingData(title: AppTexts.privacySettings, settingPage: "/privacySetting", systemSettingItems: [
    //   SystemSettingItem(subTitle: AppTexts.loginUsingBiometrics, isShowType: 0, isOpening: true),
    // ]),
    AppTexts.otherInformation: SystemSettingData(title: AppTexts.otherInformation, settingPage: "", systemSettingItems: [
      SystemSettingItem(subTitle: AppTexts.privacyPolicy, isShowType: 1, isOpening: null),
      SystemSettingItem(subTitle: AppTexts.versionNumber, isShowType: 2, isOpening: null),
    ])
  };

  // 更新設定數據
  void updateNotificationList() {
    notifyListeners(); // 通知監聽者數據發生了變化
  }
}
