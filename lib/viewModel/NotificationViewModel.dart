import 'package:flutter/cupertino.dart';
import '../data/fakeData/FakeData.dart';

// 監聽通知變化
class NotificationViewModel extends ChangeNotifier {

  NotificationViewModel._();
  static final NotificationViewModel instance = NotificationViewModel._();

  List<NotificationData> _notificationDataList = [];

  // 添加一個getter方法用於獲取未讀通知的數量
  int get unreadCount => _notificationDataList
      .where((notification) => !notification.isRead)
      .length;

  // 添加一個方法用於更新通知列表數據
  void updateNotificationList(List<NotificationData> newList) {
    _notificationDataList = newList;
    notifyListeners(); // 通知監聽者數據發生了變化
  }
}
