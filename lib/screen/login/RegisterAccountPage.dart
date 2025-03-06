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

import '../../AppRouter.dart';
import '../../repository/AccountRepository.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/BindingStorageDialog.dart';
import '../../utils/dialog/window/DefaultDialog.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/LoginInput.dart';
import '../../viewModel/AccountViewModel.dart';
import '../../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({super.key});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends BasePageState<RegisterAccountPage> {
  final TextEditingController _accountController = TextEditingController();
  Color _color = AppColors.disableGrey;

  late void Function()? onTapHandler;

  AccountViewModel accountViewModel = AccountViewModel.instance;
  AccountRepository accountRepository = AccountRepository.instance;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;

  @override
  void initState() {
    super.initState();
    updateColor();
    accountViewModel.registerAccountFocusNode.addListener(() {
      if (!accountViewModel.registerAccountFocusNode.hasFocus) {
        updateColor();
      }
    });
  }

  @override
  void dispose() {
    // 清理控制器
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 12.sp),
              GestureDetector(
                onTap: () {
                  goLogin(context);
                },
                child: getImageIcon("back.png", width: 24.sp, height: 24.sp, color: AppColors.primaryBlack),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 96.sp, 0, 28.sp),
            child: SizedBox(width: 144.w, height: 36.h, child: getImage('ihouse_banner.png')),
          ),
          thirdPartyButton(context,
              logo: 'google_icon.png',
              btnTitle: '使用 Google 註冊',
              backgroundColor: AppColors.lightBlue,
              textColor: AppColors.white, onTap: () async {
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
                btnTitle: '使用 Apple ID 註冊',
                backgroundColor: AppColors.white,
                textColor: AppColors.primaryBlack, onTap: () async {
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
          loginInput(AppTexts.accountField,
              paddingTop: 16.h,
              hintText: AppTexts.pleaseEnterEmail,
              keyboardType: TextInputType.text,
              initValue: accountRepository.registerAccount,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*()-_+=<>?/\|{}[\]~]')),
              ],
              focusNode: accountViewModel.registerAccountFocusNode,
              onChanged: (v) {
            accountRepository.registerAccount = v ?? "";
            updateColor();
            FocusScope.of(context).requestFocus(accountViewModel.registerAccountFocusNode);
          }, onSaved: (v) {
            accountRepository.registerAccount = v ?? "";
          }, validator: (msg) {
            return (msg == null || msg.isEmpty) ? AppTexts
                .pleaseReEnterAccount : (!accountRepository.registerAccount.isEmailValid())?AppTexts
                .emailFormatError:null;
          }, textEditingController: _accountController),
          const SizedBox(height: 10),
          bottomButton(context, AppTexts.register, _color,
              edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: (onTapHandler)),
        ],
      ),
    )));
  }

  void updateColor() {
    setState(() {
      if (accountRepository.registerAccount.isNotEmpty && accountRepository.registerAccount.isEmailValid()) {
        _color = AppColors.appPrimaryBlack;
        onTapHandler = () {
          AutoRouter.of(context).pushNamed('/registerPassword');
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
