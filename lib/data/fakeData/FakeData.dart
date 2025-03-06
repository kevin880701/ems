import 'dart:math';

import 'package:ems_app/data/apiResponse/attrs/Attrs.dart';
import 'package:ems_app/data/apiResponse/deviceList/DeviceListResponse.dart';
import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/data/apiResponse/node/Node.dart';
import 'package:ems_app/data/apiResponse/userInfo/UserInfoResponse.dart';
import 'package:ems_app/data/apiResponse/vals/Vals.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

String googleLoginToken = "1fdsf6ds5f1ds65f1ds3f2ds1f65ds1f";

final googleUserInfoResponse = UserInfoResponse(
  result: 0,
  data: UserInfoData(
    uid: "26ad5496-372c-4ae5-b3fd-36955fdde2d4",
    account: "googleLoginTest@gmail.com",
    name: "GOOGLE登入測試名稱",
    org: null,
    accountType: 2,
    attrs: {
      "avatar": "d26a0f0c-b87f-444d-8817-2aa7a38ef4b3",
    },
    groups: [],
    pushInfo: {
      "fcm2": {
        "token": "dq9t4GaBRZ2lUVdoSpWFev:APA91bHCp60ubra7jYnGGEd57DVaBkLvJqB2m0vDCgflKJJr2nk5fVKldMVO7sIxzHNDjUiiVUuZ6cimm8RKqLyO1g4YO-go1biXk_CmdEuLjMwfrHLqv8k",
        "status": 0,
      }
    },
  ),
);

List<DeviceListData> testDeviceListData = [
  DeviceListData(
    id: "e9a984a1-2b2d-45dc-afcc-91b389d45e4d",
    parent: null,
    devId: "404CCA4C89A0",
    name: "TEST儲能櫃1",
    modelId: 2,
    modelName: "",
    owner: null,
    activeappid: 0,
    status: 0,
    profiles: [],
    attrs: Attrs(
      timezone: "Asia/Taipei(GMT+08:00)",
      timezoneVal: "+28800",
      belongUnit: "TEST大樓1",
    ),
    vals: generateRandomVals(),
  ),
  DeviceListData(
    id: "a7b23cd4-5f67-8a90-bcde-123456789012",
    parent: null,
    devId: "AABBCCDDEEFF",
    name: "TEST儲能櫃2",
    modelId: 3,
    modelName: "",
    owner: null,
    activeappid: 0,
    status: 1,
    profiles: [],
    attrs: Attrs(
      timezone: "Asia/Taipei(GMT+08:00)",
      timezoneVal: "+28800",
      belongUnit: "TEST大樓2",
    ),
    vals: generateRandomVals(),
  ),
  DeviceListData(
    id: "f1e2d3c4-b5a6-7890-1234-56789abcdef0",
    parent: null,
    devId: "112233445566",
    name: "TEST儲能櫃3",
    modelId: 4,
    modelName: "",
    owner: null,
    activeappid: 0,
    status: 1,
    profiles: [],
    attrs: Attrs(
      timezone: "Asia/Taipei(GMT+08:00)",
      timezoneVal: "+28800",
      belongUnit: "TEST大樓3",
    ),
    vals: generateRandomVals(),
  ),
];


Vals generateRandomVals() {
  return Vals(
    info3472: "有1電池",
    info3441: "1",
    hb3450: getRandomNumber(0, 100).toString(),
    l2_3457: getRandomNumber(0, 100).toString(),
    reqAndInfo3444B8: getRandomNumber(0, 1).toString(),
    reqAndInfo3444B9: getRandomNumber(0, 1).toString(),
    l2_3449: getRandomNumber(20, 50).toString(),
    l2_3460: getRandomNumber(20.0, 50.0).toString(),
    info3516: "有2電池",
    info3485: "2",
    hb3494: getRandomNumber(0, 100).toString(),
    l2_3501: getRandomNumber(0, 100).toString(),
    reqAndInfo3488B8: getRandomNumber(0, 1).toString(),
    reqAndInfo3488B9: getRandomNumber(0, 1).toString(),
    l2_3493: getRandomNumber(20, 50).toString(),
    l2_3504: getRandomNumber(20.0, 50.0).toString(),
    info3604: "有3電池",
    info3529: "3",
    hb3538: getRandomNumber(0, 100).toString(),
    l2_3545: getRandomNumber(0, 100).toString(),
    reqAndInfo3532B8: getRandomNumber(0, 1).toString(),
    reqAndInfo3532B9: getRandomNumber(0, 1).toString(),
    l2_3537: getRandomNumber(20, 50).toString(),
    l2_3548: getRandomNumber(20.0, 50.0).toString(),
    info3560: "有4電池",
    info3573: "4",
    hb3582: getRandomNumber(0, 100).toString(),
    l2_3589: getRandomNumber(0, 100).toString(),
    reqAndInfo3576B8: getRandomNumber(0, 1).toString(),
    reqAndInfo3576B9: getRandomNumber(0, 1).toString(),
    l2_3581: getRandomNumber(20, 50).toString(),
    l2_3592: getRandomNumber(20.0, 50.0).toString(),
    brBattery: getRandomNumber(0, 100).toString(), // 圖表電池電量
    reqAndInfo3160: "1100113014302130",
    reqAndInfo3168: "0000000000000000",
    reqAndInfo3318: "2330",
    hb3445: "52.57",
    hb3455: "104.1",
    hb3489: "52.57",
    hb3499: "105.0",
    hb3533: "0.00",
    hb3543: "0.0",
    hb3577: "0.00",
    hb3587: "0.0",
    l13036: getRandomNumber(0.0, 100.0).toString(),
    pKwhMonth: getRandomNumber(0.0, 100.0).toString(),
    l33039: getRandomNumber(0.0, 100.0).toString(),
    reqAndInfo3044: "0",
  );
}



Future<EnergyListData> getTestChartData(
    String startTime, String endTime, List<String> fields, int interval) async {
  DateTime startDate = DateTime.parse(startTime);
  DateTime endDate = DateTime.parse(endTime);
  Duration step;
  Random random = Random();

  if (interval == 2) {
    step = Duration(hours: 1); // 每小時
  } else if (interval == 3) {
    step = Duration(days: 1); // 每天
  } else if (interval == 4) {
    // 特殊處理，固定到該月 1 號
    step = Duration(days: 30); // 這行其實不會用到，因為會直接設 1 號
  } else {
    throw ArgumentError('Invalid interval value');
  }

  List<EnergyData> energyList = [];
  DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  DateTime current = startDate;
  while (current.isBefore(endDate) || current.isAtSameMomentAs(endDate)) {
    energyList.add(EnergyData(
      time: formatter.format(current),
      titleList: fields,
      valueList: fields.map((_) => random.nextDouble() * 100).toList(),
    ));

    if (interval == 4) {
      // 每月固定到 1 號
      current = DateTime(current.year, current.month + 1, 1, 0, 0, 0);
    } else {
      current = current.add(step);
    }
  }

  await Future.delayed(Duration(seconds: 1));
  return EnergyListData(energyList: energyList);
}


List<String> departmentDataList = [
  "全部",
  "射出部",
  "沖壓部",
  "組立部",
  "倉管部",
  "很長的名稱測試很長的名稱測試",
  "辦公室",
];

List<ModelChooseBarData> modelChooseBarDataList = [
  ModelChooseBarData(title: "市電", percent: 0.12, value: 25, unit: AppTexts.wh),
  ModelChooseBarData(
      title: "太陽能", percent: 0.52, value: 500, unit: AppTexts.wh),
  ModelChooseBarData(
      title: "儲能櫃", percent: 0.82, value: 1013, unit: AppTexts.wh),
];

List<EnergyBenefitsData> energyBenefitsDataList = [
  EnergyBenefitsData(
      image: "green_energy.png",
      title: "綠能發電量",
      value: "283",
      unit: AppTexts.wh),
  EnergyBenefitsData(
      image: "co2_drop.png",
      title: "CO2 減排量",
      value: "1.34",
      unit: AppTexts.tCO2),
  EnergyBenefitsData(
      image: "chart.png",
      title: "對比去年同期",
      value: "10.3",
      unit: AppTexts.percent),
  EnergyBenefitsData(
      image: "cost_save.png",
      title: "已節省電費",
      value: "2,093",
      unit: AppTexts.dollar),
];

List<NotificationData> notificationDataList = [
  NotificationData(
      notificationId: 0,
      type: 0,
      title: "告警通知1",
      content: "即時用電超過設定之告警數值 120！",
      icon: "notification_error.png",
      date: DateTime(2024, 10, 31, 14, 21),
      isRead: false),
  NotificationData(
      notificationId: 1,
      type: 0,
      title: "告警通知2",
      content: "即時用電超過設定之告警數值 100！",
      icon: "notification_error.png",
      date: DateTime(2024, 10, 31, 14, 15),
      isRead: false),
  NotificationData(
      notificationId: 2,
      type: 0,
      title: "告警通知3",
      content: "即時用電超過設定之告警數值 80！",
      icon: "notification_error.png",
      date: DateTime(2024, 10, 31, 14, 00),
      isRead: false),
  NotificationData(
      notificationId: 3,
      type: 0,
      title: "告警通知4",
      content: "即時用電超過設定之告警數值 80！",
      icon: "notification_error.png",
      date: DateTime(2024, 3, 10, 14, 00),
      isRead: false),
  NotificationData(
      notificationId: 4,
      type: 0,
      title: "一年前的通知",
      content: "即時用電超過設定之告警數值 80！",
      icon: "notification_error.png",
      date: DateTime(2023, 10, 31, 14, 00),
      isRead: false),
  NotificationData(
      notificationId: 5,
      type: 0,
      title:
      "長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試長標題測試",
      content:
      "多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試多行測試",
      icon: "notification_tree.png",
      date: DateTime(2024, 10, 31, 14, 21),
      isRead: true),
];

List<Map<String, int>> timeFilterList = [
  {"全部": 100000},
  {"近15天": 15},
  {"近30天": 30},
  {"近60天": 60},
];

// 折線圖假資料
List<FlSpot> get allSpots => const [
      FlSpot(0, 3000),
      FlSpot(1, 14000),
      FlSpot(2, 7000),
      FlSpot(3, 10000),
      FlSpot(4, 3000),
      FlSpot(5, 3000),
      FlSpot(6, 14000),
      FlSpot(7, 7000),
      FlSpot(8, 2000),
      FlSpot(9, 3000),
      FlSpot(10, 3000),
      FlSpot(11, 14000),
      FlSpot(12, 7000),
      FlSpot(13, 10000),
      FlSpot(14, 3000),
      FlSpot(15, 3000),
      FlSpot(16, 14000),
      FlSpot(17, 7000),
      FlSpot(18, 10000),
      FlSpot(19, 3000),
      FlSpot(20, 3000),
      FlSpot(21, 14000),
      FlSpot(22, 7000),
      FlSpot(23, 10000),
      FlSpot(24, 3000),
      FlSpot(25, 3000),
      FlSpot(26, 14000),
      FlSpot(27, 7000),
      FlSpot(28, 10000),
      FlSpot(29, 3000)
    ];

class EnergyBenefitsData {
  final String image;
  final String title;
  final String value;
  final String unit;

  EnergyBenefitsData(
      {required this.image,
        required this.title,
        required this.value,
        required this.unit});
}

class ModelChooseBarData {
  final String title;
  final double percent;
  final int value;
  final String unit;

  ModelChooseBarData(
      {required this.title,
        required this.percent,
        required this.value,
        required this.unit});
}

class NotificationData {
  final int notificationId;
  final int type;
  final String title;
  final String content;
  final String icon;
  final DateTime date;
  bool isRead;

  NotificationData(
      {required this.notificationId,
        required this.type,
        required this.title,
        required this.content,
        required this.icon,
        required this.date,
        required this.isRead});

}
