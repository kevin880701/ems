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
import '../../repository/AccountRepository.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/PasswordInput.dart';
import '../../viewModel/AccountViewModel.dart';
import '../../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class RegisterPasswordPage extends StatefulWidget {
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends BasePageState<RegisterPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _registerPasswordFocusNode = FocusNode();
  final FocusNode _registerConfirmPasswordFocusNode = FocusNode();
  Color _color = AppColors.disableGrey;
  late void Function()? onTapHandler;
  AccountViewModel accountViewModel = AccountViewModel.instance;
  AccountRepository accountRepository = AccountRepository.instance;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
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
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              MediaQuery.of(context).padding.bottom ,child: Column(
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
                  accountRepository.registerPassword = "";
                  accountRepository.registerConfirmPassword = "";
                  Navigator.of(context).pop();
                },
                child: getImageIcon("back.png", width: 24.sp, height: 24.sp, color: AppColors.primaryBlack),
              )
            ],
          ),
          SizedBox(
            height: 24.sp,
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
              child: getText("設定密碼", fontSize: 20.sp)),
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
            initValue: accountRepository.registerPassword,
            focusNode: _registerPasswordFocusNode,
            onChanged: (v) {
              accountRepository.registerPassword = v ?? "";
              updateColor();
              FocusScope.of(context).requestFocus(_registerPasswordFocusNode);
            },
            onSaved: (v) {
              accountRepository.registerPassword = v ?? "";
            },
            validator: (msg) {
              return msg == null || msg.isEmpty ? AppTexts.pleaseReEnterPassword : null;
            },
            textEditingController: _passwordController,
          ),
          passwordInput(
            AppTexts.confirmPassword,
            suffixIconTap: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
            paddingTop: 16.h,
            hintText: AppTexts.pleaseEnterPasswordAgain,
            isPasswordVisible: isConfirmPasswordVisible,
            keyboardType: TextInputType.text,
            initValue: accountRepository.registerConfirmPassword,
            focusNode: _registerConfirmPasswordFocusNode,
            onChanged: (v) {
              accountRepository.registerConfirmPassword = v ?? "";
              updateColor();
              FocusScope.of(context).requestFocus(_registerConfirmPasswordFocusNode);
            },
            onSaved: (v) {
              accountRepository.registerConfirmPassword = v ?? "";
            },
            validator: (msg) {
              return (msg == null || msg.isEmpty) ? AppTexts.pleaseReEnterPassword : (accountRepository
                  .registerPassword != accountRepository.registerConfirmPassword) ? AppTexts.passwordInconsistent : null;
            },
            textEditingController: _confirmPasswordController,
          ),
          Spacer(),
          bottomButton(context, AppTexts.nextStep, _color,
              edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 24.sp), onTap: (onTapHandler)),
        ],
      )),
    )));
  }

  void updateColor() {
    if (accountRepository.registerPassword.isNotEmpty &&
        accountRepository.registerPassword == accountRepository.registerConfirmPassword) {
      setState(() {
        _color = AppColors.appPrimaryBlack;
        onTapHandler = () async {
          accountViewModel.userNew().then((isRegisterSuccess){
            if(isRegisterSuccess){
              accountViewModel.login(accountRepository.registerAccount, accountRepository.registerPassword).then((isLoginSuccess) {
                if (isLoginSuccess) {
                  AutoRouter.of(context).pushNamed("/enterUserName");
                }else {
                  showToast(
                      context: context,
                      text: AppTexts.loginFailed,
                      backgroundColor: AppColors.red,
                      textColor: AppColors.white);
                }
              });
            }else{
              showToast(
                  context: context,
                  text: AppTexts.registerFailed,
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
