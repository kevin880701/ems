import 'package:ems_app/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';

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
