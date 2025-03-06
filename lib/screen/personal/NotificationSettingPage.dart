import 'package:auto_route/annotations.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/SettingViewModel.dart';

@RoutePage()
class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends BasePageState<NotificationSettingPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  SettingViewModel settingViewModel = SettingViewModel.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(children: [
        TitleBar2(
          title: AppTexts.notificationSetting,
          leftWidget: GestureDetector(
              onTap: () {
                settingViewModel.updateNotificationList();
                Navigator.of(context).pop();
              },
              child: getImageIcon("back.png", height: 28.sp, width: 28.sp, color: AppColors.appPrimaryBlack)),
          rightWidget: SizedBox(),
        ),
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(18.sp, 4.sp, 18.sp, 4.sp),
            color: AppColors.milkOrange,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getImageIcon("information.png", height: 16.sp, width: 16.sp, color: AppColors.orange),
                SizedBox(
                  width: 8.sp,
                ),
                getText("如關閉推播，您將不會收到該項目相關的推播通知",
                    fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.orange),
              ],
            )),
        Expanded(
          child: Column(children: [
            for (var i = 0;
                i < settingViewModel.systemSettingDataMap[AppTexts.notificationSetting]!.systemSettingItems.length;
                i++)
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.sp),
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(
                            settingViewModel
                                .systemSettingDataMap[AppTexts.notificationSetting]!.systemSettingItems[i].subTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                        CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: settingViewModel
                              .systemSettingDataMap[AppTexts.notificationSetting]!.systemSettingItems[i].isOpening!,
                          activeColor: CupertinoColors.systemGreen,
                          onChanged: (bool? value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              settingViewModel.systemSettingDataMap[AppTexts.notificationSetting]!.systemSettingItems[i]
                                      .isOpening =
                                  !settingViewModel.systemSettingDataMap[AppTexts.notificationSetting]!
                                      .systemSettingItems[i].isOpening!;
                              // switchValue = value ?? false;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1.sp,
                    color: AppColors.borderGrey,
                  )
                ],
              )
          ]),
        ),
      ])),
    );
  }
}
