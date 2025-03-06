import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../AppRouter.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/AccountViewModel.dart';
import '../../viewModel/SettingViewModel.dart';

@RoutePage()
class SystemSettingPage extends StatefulWidget {
  const SystemSettingPage({super.key});

  @override
  State<SystemSettingPage> createState() => _SystemSettingPageState();
}

class _SystemSettingPageState extends BasePageState<SystemSettingPage> {
  // SettingViewModel settingViewModel = SettingViewModel.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(children: [
        TitleBar2(
          title: AppTexts.systemSetting,
          leftWidget: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: getImageIcon("back.png", height: 28.sp, width: 28.sp, color: AppColors.appPrimaryBlack)),
          rightWidget: SizedBox(),
        ),
        Expanded(
            child: SingleChildScrollView(child: Consumer<SettingViewModel>(builder: (context, settingViewModel, _) {
          return Container(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: settingViewModel.systemSettingDataMap.entries.map((entry) {
                      var key = entry.key;
                      var systemSettingData = entry.value;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getText(systemSettingData.title, fontSize: 16.sp, color: AppColors.primaryBlack),
                                (systemSettingData.settingPage != "")
                                    ? GestureDetector(
                                        onTap: () {
                                          AutoRouter.of(context).pushNamed(systemSettingData.settingPage);
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            getText(AppTexts.setting, fontSize: 14.sp, color: AppColors.lightBlue),
                                            getImageIcon("arrow_right.png",
                                                height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          for (int i = 0; i < systemSettingData.systemSettingItems.length; i++)
                            GestureDetector(
                              onTap: () {
                                if (systemSettingData.systemSettingItems[i].subTitle == AppTexts.privacyPolicy) {
                                  AutoRouter.of(context).pushNamed("/privacyPolicy");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(20.sp),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular((i == 0) ? 16.sp : 0.sp),
                                      topRight: Radius.circular((i == 0) ? 16.sp : 0.sp),
                                      bottomLeft: Radius.circular(
                                          (i == systemSettingData.systemSettingItems.length - 1) ? 16.sp : 0.sp),
                                      bottomRight: Radius.circular(
                                          (i == systemSettingData.systemSettingItems.length - 1) ? 16.sp : 0.sp),
                                    ),
                                    border: Border(bottom: BorderSide(color: AppColors.bgColor, width: 1.sp))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    getText(systemSettingData.systemSettingItems[i].subTitle,
                                        fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.primaryBlack),
                                    (systemSettingData.systemSettingItems[i].isShowType == 0)
                                        ? (systemSettingData.systemSettingItems[i].isOpening!)
                                            ? getText(AppTexts.opening, fontSize: 16.sp, color: AppColors.primaryBlack)
                                            : getText(AppTexts.closed, fontSize: 16.sp, color: AppColors.red)
                                        : (systemSettingData.systemSettingItems[i].isShowType == 1)
                                            ? getImageIcon("arrow_right.png",
                                                height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
                                            : getText(AccountViewModel.instance.packageInfoVersion,
                                                fontSize: 16.sp, color: AppColors.primaryBlack)
                                  ],
                                ),
                              ),
                            ),
                        ],
                        // 使用systemSettingData构建Container
                      );
                    }).toList(),
                  ),
                  GestureDetector(
                    onTap: () {
                      goLogin(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.all(28.sp),
                      padding: EdgeInsets.fromLTRB(18.sp, 12.sp, 18.sp, 12.sp),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)), color: AppColors.appPrimaryBlack),
                      child: getText(AppTexts.logout, fontSize: 16.sp, color: AppColors.white),
                    ),
                  )
                ],
              ));
        })))
      ])),
    );
  }
}
