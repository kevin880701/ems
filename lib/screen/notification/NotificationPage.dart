
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/fakeData/FakeData.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/SearchFilterDialog.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/NotificationViewModel.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<NotificationPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  NotificationViewModel notificationViewModel = NotificationViewModel.instance;
  late var notificationList;
  String keyword = "";
  int timeFilterIndex = 0;
  int pageLabelIndex = 0;

  @override
  void initState() {
    super.initState();
    notificationList = notificationDataList;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(children: [
            TitleBar2(
              title: AppTexts.notification,
              rightWidget: GestureDetector(
                  onTap: () {
                    setState(() {
                      // 將當前顯示的所有通知設為已讀（不是全部，有可能被篩選過）
                      notificationList.forEach((notification) {
                        notification.isRead = true;
                        // 在通知總列表中找到相應的項目並進行更新
                        var index = notificationDataList.indexWhere((data) =>
                        data.notificationId == notification.notificationId);
                        if (index != -1) {
                          notificationDataList[index].isRead = true;
                        }
                        notificationViewModel.updateNotificationList(notificationDataList);
                      });
                    });
                  },
                  child: getText(
                    AppTexts.allRead,
                    fontSize: 14.sp,
                    color: AppColors.appPrimaryBlack,
                  )),
            ),
            GestureDetector(
              onTap: () {
                showSearchFilterDialog(
                  context,
                  SearchFilterDialog(
                      keyword: keyword,
                      timeFilterIndex: timeFilterIndex,
                      pageLabelIndex: pageLabelIndex,
                      filterNotifications: _filterNotifications),
                );
              },
              child: searchBar(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  // 目前只有一種通知顯示方式，先預留其他種類通知判斷方式
                  switch (notificationList[index].type) {
                    case 0:
                      return notificationItemNormal(notificationList[index]);
                    case 1:
                      return Container();
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ])),
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.sp, 12.sp, 20.sp, 12.sp),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.sp, 14.sp, 16.sp, 14.sp),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            getImageIcon("search.png",
                height: 16.sp, width: 16.sp, color: AppColors.grey),
            SizedBox(
              width: 8.sp,
            ),
            getText(
              (keyword.isEmpty && timeFilterIndex == 0 && pageLabelIndex == 0)
                  ? AppTexts.searchAndFilter
                  : '$keyword - ${timeFilterList[timeFilterIndex].keys.first} - ${departmentDataList[pageLabelIndex]}',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget notificationItemNormal(NotificationData notificationData) {
    return GestureDetector(
        onTap: () {
          setState(() {
            notificationList.forEach((notification) {
              if (notification.notificationId ==
                  notificationData.notificationId) {
                notification.isRead = true;
              }
            });
            notificationViewModel.updateNotificationList(notificationList);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.bgColor,
                width: 1.sp,
              ),
            ),
            color: AppColors.white,
          ),
          padding: EdgeInsets.fromLTRB(20.sp, 12.sp, 20.sp, 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getImage(notificationData.icon, width: 20.sp, height: 20.sp),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Expanded(
                      child: getText(notificationData.title,
                          fontSize: 16.sp,
                          color: AppColors.primaryBlack,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  notificationData.isRead
                      ? SizedBox(width: 8.sp, height: 8.sp)
                      : Container(
                    width: 8.sp,
                    height: 8.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.sp,
              ),
              getText(notificationData.content,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.primaryBlack,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              SizedBox(
                height: 8.sp,
              ),
              getText(
                dateConvert(notificationData.date),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
            ],
          ),
        ));
  }

  void _filterNotifications(
      String keyword, int timeFilterIndex, int pageLabelIndex) {
    setState(() {
      this.keyword = keyword;
      this.timeFilterIndex = timeFilterIndex;
      // 頁面標籤資料尚未定義，暫時不加入篩選條件
      this.pageLabelIndex = pageLabelIndex;

      DateTime timeRange = DateTime.now().subtract(
          Duration(days: timeFilterList[timeFilterIndex].values.first));

      notificationList = notificationDataList
          .where((notification) =>
      (notification.title
          .toLowerCase()
          .contains(keyword.toLowerCase()) ||
          notification.content
              .toLowerCase()
              .contains(keyword.toLowerCase())) &&
          notification.date.isAfter(timeRange))
          .toList();
    });
  }
}
