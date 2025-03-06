import 'package:auto_route/annotations.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/SettingViewModel.dart';

@RoutePage()
class PrivacySettingPage extends StatefulWidget {
  const PrivacySettingPage({super.key});

  @override
  State<PrivacySettingPage> createState() => _PrivacySettingPageState();
}

class _PrivacySettingPageState extends BasePageState<PrivacySettingPage> {

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
          title: AppTexts.privacySettings,
          leftWidget: GestureDetector(
              onTap: () {
                settingViewModel.updateNotificationList();
                Navigator.of(context).pop();
              },
              child: getImageIcon("back.png", height: 28.sp, width: 28.sp, color: AppColors.appPrimaryBlack)),
          rightWidget: SizedBox(),
        ),
        Expanded(
          child: Column(children: [
            for (var i = 0;
                i < settingViewModel.systemSettingDataMap[AppTexts.privacySettings]!.systemSettingItems.length;
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
                                .systemSettingDataMap[AppTexts.privacySettings]!.systemSettingItems[i].subTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                        CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: settingViewModel
                              .systemSettingDataMap[AppTexts.privacySettings]!.systemSettingItems[i].isOpening!,
                          activeColor: CupertinoColors.systemGreen,
                          onChanged: (bool? value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              settingViewModel.systemSettingDataMap[AppTexts.privacySettings]!.systemSettingItems[i]
                                      .isOpening =
                                  !settingViewModel.systemSettingDataMap[AppTexts.privacySettings]!
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
