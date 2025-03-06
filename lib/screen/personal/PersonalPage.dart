import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:provider/provider.dart';
import '../../net/remote/ApiEndPoint.dart';
import '../../repository/AccountRepository.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/AccountViewModel.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends BasePageState<PersonalPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final AccountRepository accountRepository = AccountRepository.instance;

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
          bottom: false,
          child: Column(children: [
            TitleBar2(
              title: AppTexts.personal,
              leftWidget: SizedBox(),
              rightWidget: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pushNamed("/systemSetting");
                  },
                  child: getImageIcon("setting.png", height: 28.sp, width: 28.sp, color: AppColors.appPrimaryBlack)),
            ),
            Consumer<AccountViewModel>(builder: (context, accountViewModel, _) {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pushNamed("/accountManager");
                    },
                    child: Container(
                      margin: EdgeInsets.all(16.sp),
                      padding: EdgeInsets.fromLTRB(18.sp, 12.sp, 18.sp, 12.sp),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)), color: AppColors.white),
                      child: Row(
                        children: [
                          Container(
                            width: 48.sp,
                            height: 48.sp,
                            child: accountViewModel.accountRepository.userInfo.attrs['avatar'] != null &&
                                accountViewModel.accountRepository.userInfo.attrs['avatar']!.isNotEmpty
                                ? ClipOval(
                              child: Image.network(
                                "${ApiEndPoint.getAvatar}${accountViewModel.accountRepository.userInfo.attrs['avatar']}",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return ProfilePhoto(
                                    totalWidth: 48.sp,
                                    cornerRadius: 50,
                                    color: AppColors.grey,
                                    outlineWidth: 10,
                                    outlineColor: AppColors.grey,
                                    image: AssetImage('assets/images/personal.png'),
                                  );
                                },
                              ),
                            )
                                : ProfilePhoto(
                              totalWidth: 48.sp,
                              cornerRadius: 50,
                              color: AppColors.grey,
                              outlineWidth: 10,
                              outlineColor: AppColors.grey,
                              image: AssetImage('assets/images/personal.png'),
                            ),
                          ),
                          SizedBox(
                            width: 8.sp,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(
                                  accountViewModel.accountRepository.userInfo.name == AppTexts.na ||
                                          accountViewModel.accountRepository.userInfo.name == null
                                      ? AppTexts.nameNotSet
                                      : accountViewModel.accountRepository.userInfo.name!,
                                  color: accountViewModel.accountRepository.userInfo.name == AppTexts.na ||
                                          accountViewModel.accountRepository.userInfo.name == null
                                      ? AppColors.grey
                                      : AppColors.primaryBlack,
                                  fontSize: 16.sp,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(
                                height: 8.sp,
                              ),
                              getText(accountViewModel.accountRepository.userInfo.account.toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                          getImageIcon("arrow_right.png", height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(24.sp, 0, 0, 8.sp),
                      child: getText(AppTexts.energyStorage, fontSize: 16.sp, color: AppColors.appPrimaryBlack)),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(24.sp, 8.sp, 0, 8.sp),
                      color: AppColors.white,
                      child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).pushNamed("/registerDeviceQr");
                          },
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            getText("註冊儲能櫃", fontSize: 16.sp, color: AppColors.lightBlue),
                            getImageIcon("arrow_right.png", height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
                          ]))),
                  // Container(
                  //     padding: EdgeInsets.fromLTRB(24.sp, 0, 0, 8.sp),
                  //     child: getText(AppTexts.householdType, fontSize: 16.sp, color: AppColors.appPrimaryBlack)),
                  // Container(
                  //     width: double.infinity,
                  //     padding: EdgeInsets.fromLTRB(24.sp, 14.sp, 24.sp, 14.sp),
                  //     color: AppColors.white,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             getText("10F3-1", fontSize: 20.sp, color: AppColors.appPrimaryBlack),
                  //             SizedBox(
                  //               height: 4.sp,
                  //             ),
                  //             getText("acoount1234", fontSize: 16.sp, color: AppColors.grey)
                  //           ],
                  //         ),
                  //         getText(AppTexts.moreInformationAdd, fontSize: 14.sp, color: AppColors.lightBlue)
                  //       ],
                  //     ))
                ],
              ));
            })
          ])),
    );
  }
}
