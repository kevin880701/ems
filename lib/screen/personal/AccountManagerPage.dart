import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:provider/provider.dart';
import '../../AppRouter.dart';
import '../../net/remote/ApiEndPoint.dart';
import '../../repository/AccountRepository.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/ChangeUserNameDialog.dart';
import '../../utils/dialog/window/DefaultDialog.dart';
import '../../utils/dialog/window/EditPictureDialog.dart';
import '../../utils/widgets/main/TitleBar2.dart';
import '../../viewModel/AccountViewModel.dart';

@RoutePage()
class AccountManagerPage extends StatefulWidget {
  const AccountManagerPage({super.key});

  @override
  State<AccountManagerPage> createState() => _AccountManagerPageState();
}

class _AccountManagerPageState extends BasePageState<AccountManagerPage> {
  final AccountRepository accountRepository = AccountRepository.instance;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
            color: AppColors.bgColor,
            child: Column(
              children: [
                TitleBar2(
                  title: AppTexts.accountManager,
                  leftWidget: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: getImageIcon("back.png", height: 28.sp, width: 28.sp, color: AppColors.appPrimaryBlack)),
                  rightWidget: const SizedBox(),
                ),
                Container(
                  height: 1.sp,
                  color: AppColors.borderGrey,
                ),
                Consumer<AccountViewModel>(builder: (context, accountViewModel, _) {
                  return Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top -
                                  MediaQuery.of(context).padding.bottom -
                                  AppBar().preferredSize.height -
                                  44.sp,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 24.sp),
                                    color: AppColors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 68.sp,
                                          height: 68.sp,
                                          child: accountViewModel.accountRepository.userInfo.attrs['avatar'] != null &&
                                              accountViewModel.accountRepository.userInfo.attrs['avatar']!.isNotEmpty
                                              ? ClipOval(
                                            child: Image.network(
                                              "${ApiEndPoint.getAvatar}${accountViewModel.accountRepository.userInfo.attrs['avatar']}",
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return ProfilePhoto(
                                                  totalWidth: 68.sp,
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
                                            totalWidth: 68.sp,
                                            cornerRadius: 50,
                                            color: AppColors.grey,
                                            outlineWidth: 10,
                                            outlineColor: AppColors.grey,
                                            image: AssetImage('assets/images/personal.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.sp,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 20.sp,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDefaultDialog(context, const EditPictureDialog());
                                              },
                                              child: Row(
                                                children: [
                                                  getText(AppTexts.editPicture,
                                                      fontSize: 14.sp, color: AppColors.lightBlue),
                                                  getImageIcon("arrow_right.png",
                                                      height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.sp,
                                        ),
                                        itemWidget(
                                            getText(
                                              AppTexts.name,
                                              fontSize: 16.sp,
                                            ),
                                            accountViewModel.accountRepository.userInfo.name == AppTexts.na ||
                                                    accountViewModel.accountRepository.userInfo.name == null
                                                ? AppTexts.nameNotSet
                                                : accountViewModel.accountRepository.userInfo.name!,
                                            contentColor:
                                                accountViewModel.accountRepository.userInfo.name == AppTexts.na ||
                                                        accountViewModel.accountRepository.userInfo.name == null
                                                    ? AppColors.grey
                                                    : AppColors.primaryBlack,
                                            rightText: AppTexts.edit, onTap: () {
                                          showDefaultDialog(context, const ChangeUserNameDialog());
                                        }),
                                        if (accountViewModel.accountRepository.userInfo.accountType == 0 ||
                                            accountViewModel.accountRepository.userInfo.accountType == 1)
                                          Column(
                                            children: [
                                              itemWidget(
                                                getText(
                                                  AppTexts.account,
                                                  fontSize: 16.sp,
                                                ),
                                                accountViewModel.accountRepository.userInfo.account.toString(),
                                              ),
                                              itemWidget(
                                                getText(
                                                  AppTexts.password,
                                                  fontSize: 16.sp,
                                                  color: AppColors.primaryBlack,
                                                ),
                                                "**********",
                                                // rightText: AppTexts.edit
                                              ),
                                            ],
                                          ),
                                        if (accountViewModel.accountRepository.userInfo.accountType == 2)
                                          itemWidget(
                                            getImage("google_icon.png", height: 28.sp),
                                            accountViewModel.accountRepository.userInfo.account.toString(),
                                          ),
                                        if (accountViewModel.accountRepository.userInfo.accountType == 3)
                                          itemWidget(
                                            getImage("apple_icon.png", height: 28.sp),
                                            accountViewModel.accountRepository.userInfo.account.toString(),
                                          )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      showDeleteAccountDialog(
                                          context,
                                          DefaultDialog(
                                            title: AppTexts.deleteAccount,
                                            description: AppTexts.deleteAccountDescription,
                                            rightButtonText: AppTexts.confirm,
                                            rightOnTap: () {
                                              accountViewModel.deleteUser().then((value) {
                                                goLogin(context);
                                              });
                                            },
                                          ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(28.sp),
                                      padding: EdgeInsets.fromLTRB(18.sp, 12.sp, 18.sp, 12.sp),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(16)),
                                          color: AppColors.borderGrey),
                                      child: getText(AppTexts.deleteAccount, fontSize: 16.sp, color: AppColors.red),
                                    ),
                                  ),
                                ],
                              ))));
                })
              ],
            )),
      ),
    );
  }

  Widget itemWidget(Widget fieldTitle, String content,
      {Color? contentColor = AppColors.primaryBlack,
      String? rightText = null,
      Color rightColor = AppColors.lightBlue,
      Function()? onTap = null}) {
    return Container(
      padding: EdgeInsets.fromLTRB(28.sp, 8.sp, 28.sp, 8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 25,
            child: Align(
              alignment: Alignment.centerLeft,
              child: fieldTitle,
            ),
          ),
          Expanded(
              flex: 75,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: getText(
                        content,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: contentColor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      rightText != null
                          ? GestureDetector(
                              onTap: onTap,
                              child: Row(
                                children: [
                                  getText(
                                    rightText,
                                    fontSize: 16.sp,
                                    color: rightColor,
                                  ),
                                  getImageIcon("arrow_right.png", height: 16.sp, color: rightColor)
                                ],
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    height: 1.sp,
                    color: AppColors.borderGrey,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
