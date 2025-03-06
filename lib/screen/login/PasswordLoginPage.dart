import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ems_app/utils/toast/toastification.dart';
import '../../AppRouter.dart';
import '../../repository/AccountRepository.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/BindingStorageDialog.dart';
import '../../utils/dialog/window/DefaultDialog.dart';
import '../../utils/dialog/window/ForgotPasswordDialog.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/PasswordInput.dart';
import '../../viewModel/AccountViewModel.dart';
import '../../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({super.key});

  @override
  State<PasswordLoginPage> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends BasePageState<PasswordLoginPage> {
  TextEditingController _controller = TextEditingController();
  Color _color = AppColors.disableGrey;
  late void Function()? onTapHandler;
  AccountViewModel accountViewModel = AccountViewModel.instance;
  AccountRepository accountRepository = AccountRepository.instance;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  bool isPasswordVisible = false;
  bool isLoginError = true;

  @override
  void initState() {
    super.initState();
    accountRepository.password = "";
    updateColor();
    accountViewModel.passwordFocusNode.addListener(() {
      if (!accountViewModel.passwordFocusNode.hasFocus) {
        updateColor();
      }
    });
  }

  @override
  void dispose() {
    // 清理控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        AppBar().preferredSize.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 12.sp),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                                  getImageIcon("back.png", width: 24.sp, height: 24.sp, color: AppColors.primaryBlack),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.sp,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                            child: getText(AppTexts.password, fontSize: 20.sp)),
                        passwordInput(
                          AppTexts.passwordField,
                          suffixIconTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          paddingTop: 16.h,
                          hintText: AppTexts.pleaseEnterPassword,
                          isPasswordVisible: isPasswordVisible,
                          keyboardType: TextInputType.text,
                          initValue: accountRepository.password,
                          focusNode: accountViewModel.passwordFocusNode,
                          onChanged: (v) {
                            accountRepository.password = v ?? "";
                            isLoginError = true;
                            updateColor();
                            FocusScope.of(context).requestFocus(accountViewModel.passwordFocusNode);
                            // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                          },
                          onSaved: (v) {
                            accountRepository.password = v ?? "";
                          },
                          validator: (msg) {
                            return (isLoginError == false && (msg == null || msg.isNotEmpty))
                                ? AppTexts.pleaseReEnterPassword
                                : null;
                          },
                          textEditingController: _controller,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                          child: GestureDetector(
                              child: getText(AppTexts.forgotPassword, fontSize: 14.sp),
                              onTap: () {
                                showDefaultDialog(context, const ForgotPasswordDialog());
                              }),
                        ),
                        const SizedBox(height: 10),
                        Spacer(),
                        bottomButton(context, AppTexts.finishLogin, _color,
                            edge: EdgeInsets.fromLTRB(28.sp, 0, 28.sp, 16.sp), onTap: (onTapHandler)),
                      ],
                    )))));
  }

  void updateColor() {
    if (accountRepository.password.isNotEmpty) {
      setState(() {
        _color = AppColors.appPrimaryBlack;
        onTapHandler = () async {
          // EasyLoading.show();
          await accountViewModel.login(accountRepository.account, accountRepository.password).then((isLoginSuccess) {
            if (isLoginSuccess) {
              energyStorageViewModel.getListDevice().then((value) {
                if (energyStorageViewModel.deviceList.isNotEmpty) {
                  goMain(context);
                } else {
                  showDefaultDialog(
                      context,
                      const BindingStorageDialog());
                }
              });
            } else {
              showToast(
                  context: context,
                  text: AppTexts.loginFailed,
                  backgroundColor: AppColors.red,
                  textColor: AppColors.white);
            }
          });
        };
      });
    } else {
      setState(() {
        _color = AppColors.disableGrey;
        onTapHandler = null;
      });
    }
  }
}
