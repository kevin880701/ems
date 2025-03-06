import 'dart:io';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:ems_app/utils/widgets/login/ThirdPartyButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../AppRouter.dart';
import '../repository/AccountRepository.dart';
import '../utils/dialog/DialogManager.dart';
import '../utils/dialog/window/BindingStorageDialog.dart';
import '../utils/widgets/login/LoginInput.dart';
import '../utils/widgets/login/BottomButton.dart';
import '../viewModel/AccountViewModel.dart';
import '../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> with WidgetsBindingObserver {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _orgController = TextEditingController();
  Color _color = AppColors.disableGrey;

  late void Function()? onTapHandler;

  AccountViewModel accountViewModel = AccountViewModel.instance;
  AccountRepository accountRepository = AccountRepository.instance;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;

  @override
  void initState() {
    super.initState();
    updateColor();
    accountViewModel.accountFocusNode.addListener(() {
      if (!accountViewModel.accountFocusNode.hasFocus) {
        updateColor();
      }
    });
    accountViewModel.autoLogin().then((isAutoLogin) {
      if (isAutoLogin) {
        EasyLoading.show();
        energyStorageViewModel.getListDevice().then((value) {
          if (energyStorageViewModel.deviceList.isNotEmpty) {
            goMain(context);
          } else {
            showDefaultDialog(
                context,
                const BindingStorageDialog());
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // 清理控制器
    _orgController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 取得APP版本號
    PackageInfo.fromPlatform().then((packageInfo) {
      AccountViewModel.instance.packageInfoVersion = packageInfo.version;
    });

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 96.sp, 0, 28.sp),
                    child: SizedBox(width: 144.w, height: 36.h, child: getImage('ihouse_banner.png')),
                  ),
                  thirdPartyButton(context,
                      logo: 'google_icon.png',
                      btnTitle: '使用 Google 登入',
                      backgroundColor: AppColors.lightBlue,
                      textColor: AppColors.white,
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        /**Google 登入完成*/
                        await accountViewModel.googleSignIn().then((loginStatus) {
                          if (loginStatus == 0) {
                            energyStorageViewModel.getListDevice().then((value) {
                              if (energyStorageViewModel.deviceList.isNotEmpty) {
                                goMain(context);
                              } else {
                                showDefaultDialog(
                                    context,
                                    const BindingStorageDialog());
                              }
                            });
                          } else if (loginStatus == 1) {
                            AutoRouter.of(context).pushNamed("/enterUserName");
                          } else {
                            showToast(
                                context: context,
                                text: AppTexts.loginFailed,
                                backgroundColor: AppColors.red,
                                textColor: AppColors.white);
                          }
                        });
                      }),
                  if (Platform.isIOS)
                    thirdPartyButton(context,
                        logo: 'apple_icon.png',
                        btnTitle: '使用 Apple ID 登入',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.primaryBlack,
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          /**AppleID登入完成*/
                          await accountViewModel.appleIDSignIn().then((loginStatus) {
                            if (loginStatus == 0) {
                              energyStorageViewModel.getListDevice().then((value) {
                                if (energyStorageViewModel.deviceList.isNotEmpty) {
                                  goMain(context);
                                } else {
                                  showDefaultDialog(
                                      context,
                                      const BindingStorageDialog());
                                }
                              });
                            } else if (loginStatus == 1) {
                              AutoRouter.of(context).pushNamed("/enterUserName");
                            } else {
                              showToast(
                                  context: context,
                                  text: AppTexts.loginFailed,
                                  backgroundColor: AppColors.red,
                                  textColor: AppColors.white);
                            }
                          });
                        }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 5.0,
                          color: Colors.grey,
                          thickness: 1.0,
                          indent: 16.0,
                          endIndent: 16.0,
                        ),
                      ),
                      getText('或', fontWeight: FontWeight.w400, fontSize: 16.sp),
                      Expanded(
                        child: Divider(
                          height: 5.0,
                          color: Colors.grey,
                          thickness: 1.0,
                          indent: 16.0,
                          endIndent: 16.0,
                        ),
                      ),
                    ],
                  ),
                  // loginInput(AppTexts.orgField,
                  //     paddingTop: 16.h,
                  //     hintText: AppTexts.pleaseEnterOrg,
                  //     keyboardType: TextInputType.text,
                  //     initValue: accountRepository.org,
                  //     focusNode: accountViewModel.orgFocusNode, onChanged: (v) {
                  //   accountRepository.org = v ?? "";
                  //   updateColor();
                  //   FocusScope.of(context).requestFocus(accountViewModel.orgFocusNode);
                  //   // _orgController.selection = TextSelection.fromPosition(TextPosition(offset: _orgController.text.length));
                  // }, onSaved: (v) {
                  //   accountRepository.org = v ?? "";
                  // }, validator: (msg) {
                  //   return msg == null || msg.isEmpty
                  //       ? AppTexts.pleaseReEnterOrg
                  //       : null;
                  // }, textEditingController: _orgController),
                  loginInput(AppTexts.accountField,
                      paddingTop: 16.h,
                      hintText: AppTexts.pleaseEnterEmail,
                      keyboardType: TextInputType.text,
                      initValue: accountRepository.account,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*()-_+=<>?/\|{}[\]~]')),
                      ],
                      focusNode: accountViewModel.accountFocusNode,
                      onChanged: (v) {
                        accountRepository.account = v ?? "";
                        updateColor();
                        FocusScope.of(context).requestFocus(accountViewModel.accountFocusNode);
                        // _accountController.selection = TextSelection.fromPosition(TextPosition(offset: _accountController.text.length));
                      },
                      onSaved: (v) {
                        accountRepository.account = v ?? "";
                      },
                      validator: (msg) {
                        return msg == null || msg.isEmpty ? AppTexts.pleaseReEnterAccount : null;
                      },
                      textEditingController: _accountController),
                  const SizedBox(height: 10),
                  bottomButton(context, AppTexts.login, _color,
                      edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: (onTapHandler)),
                  // GestureDetector(
                  //   // 目前無生物辨識功能，先註解
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  //     height: 150,
                  //     child: Center(
                  //       child: Column(
                  //         children: [
                  //           Image.asset('assets/images/face_identify.png', width: 56, height: 56),
                  //           const SizedBox(height: 5),
                  //           const Text(
                  //             '使用生物辨識',
                  //             style: TextStyle(fontSize: 14),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () async {
                  //     if (Platform.isIOS) {
                  //       print('觸發iOS生物辨識！');
                  //       // var isLoginSuccess = accountViewModel.isFirstLogin
                  //       //     ? await accountViewModel.appleIDSignIn()
                  //       //     : await accountViewModel.faceIDSignIn();
                  //       // if (isLoginSuccess) {
                  //       //   AutoRouter.of(context).pushNamed("/main");
                  //       // }
                  //       print('觸發生物辨識');
                  //       auth.checkAvalableBiometricFeat();
                  //       print('auth.isAuthenticated:${auth.isAuthenticated}');
                  //       auth.makeAuth(() {
                  //         AutoRouter.of(context).pushNamed("/main");
                  //       });
                  //     } else if (Platform.isAndroid) {
                  //       print('觸發生物辨識');
                  //       auth.checkAvalableBiometricFeat();
                  //       print('auth.isAuthenticated:${auth.isAuthenticated}');
                  //       auth.makeAuth(() {
                  //         AutoRouter.of(context).pushNamed("/main");
                  //       });
                  //     }
                  //   },
                  // ),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getText("還沒有帳號?", fontSize: 14.sp,
                              color: AppColors.appPrimaryBlack,
                              fontWeight: FontWeight.w400),
                          GestureDetector(
                              child: getText("註冊帳號", fontSize: 14.sp, color: AppColors.appPrimaryBlue),
                              onTap: () {
                                AutoRouter.of(context).pushNamed("/registerAccount");
                              }),
                        ],
                      )),
                ],
              ),
            )));
  }

  void updateColor() {
    setState(() {
      if (accountRepository.account.isNotEmpty) {
        _color = AppColors.appPrimaryBlack;
        onTapHandler = () {
          AutoRouter.of(context).pushNamed('/passwordLogin');
        };
      } else {
        setState(() {
          _color = AppColors.disableGrey;
          onTapHandler = null;
        });
      }
    });
  }
}
