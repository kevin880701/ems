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
import '../../AppRouter.gr.dart';
import '../../repository/AccountRepository.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/ForgotPasswordDialog.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/LoginInput.dart';
import '../../utils/widgets/login/PasswordInput.dart';
import '../../viewModel/AccountViewModel.dart';
import 'RegisterDeviceQrPage.dart';

@RoutePage()
class EnterUserNamePage extends StatefulWidget {
  const EnterUserNamePage({super.key});

  @override
  State<EnterUserNamePage> createState() => _EnterUserNamePageState();
}

class _EnterUserNamePageState extends BasePageState<EnterUserNamePage> {
  AccountViewModel accountViewModel = AccountViewModel.instance;
  late TextEditingController _controller;
  late void Function()? onTapHandler;
  String name = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: name);
  }

  @override
  void dispose() {
    // 清理控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          goLogin(context);
        },
        child: Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom -
                      AppBar().preferredSize.height,child: Column(
            children: [
              SizedBox(
                height: 72.sp,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                  child: getText(AppTexts.personalInformation, fontSize: 20.sp)),
              loginInput(
                AppTexts.nameField,
                paddingTop: 16.h,
                hintText: AppTexts.pleaseEnterName,
                keyboardType: TextInputType.text,
                initValue: name,
                onChanged: (text) {
                  setState(() {
                    name = text!;
                    var matches = containsEmoji(name);
                    if (matches.isNotEmpty) {
                      for (var match in matches) {
                        int start = match.start;
                        int end = match.end;
                        // 移除匹配到的表情符號
                        name = name.replaceRange(start, end, '');
                      }
                      _controller.text = name;
                      // 移動游標到最後一個字符的位置
                      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                      showToast(
                          context: context,
                          text: AppTexts.emojiNotAllow,
                          backgroundColor: AppColors.red,
                          textColor: AppColors.white);
                      print("文字中包含表情符號！");
                    } else {
                      print("文字中沒有包含表情符號。");
                    }
                  });
                },
                onSaved: (v) {
                  name = v ?? "";
                },
                validator: (msg) {
                  return (msg == null || msg.isEmpty) ? AppTexts.nameCannotEmpty : null;
                },
                textEditingController: _controller,
              ),
              Spacer(),
              bottomButton(context, AppTexts.bindEnergyStorageNow,
                  name.isEmpty ? AppColors.disableGrey : AppColors.appPrimaryBlack,
                  edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: () {
                if (name.isNotEmpty) {
                  accountViewModel.changeUserName(name).then((isChangeNameSuccess) {
                    if (isChangeNameSuccess) {
                      // AutoRouter.of(context).pushNamed("/registerDeviceQr");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterDeviceQrPage(
                            isFirstUse: true,
                          ),
                        ),
                      );
                    } else {
                      showToast(
                          context: context,
                          text: AppTexts.setNameFailed,
                          backgroundColor: AppColors.red,
                          textColor: AppColors.white);
                    }
                  });
                }
              }),
              bottomButton(context, AppTexts.bindLater, AppColors.bgColor,
                  edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: () {
                if (_controller.text.isNotEmpty) {
                  accountViewModel.changeUserName(_controller.text).then((isChangeNameSuccess) {
                    if (isChangeNameSuccess) {
                      AutoRouter.of(context).pushNamed("/bindEnergyStorage");
                    } else {
                      showToast(
                          context: context,
                          text: AppTexts.setNameFailed,
                          backgroundColor: AppColors.red,
                          textColor: AppColors.white);
                    }
                  });
                }
              }, textColor: _controller.text.isEmpty ? AppColors.disableGrey : AppColors.primaryBlack)
            ],
          ))),
        )));
  }
}
