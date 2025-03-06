import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/screen/BasePageState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/LoginDialog.dart';
import '../../utils/widgets/login/LoginHeader.dart';
import '../../utils/widgets/login/LoginInput.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/LoginLogo.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage> {
  String _mEmail = '';
  Color _color = Color(0xFFD2D2D2);
  late void Function()? onTapHandler;
  FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    updateColor(); // 初始化按鈕顏色
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        updateColor();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Column(children: [
              loginLogo(),
              loginHeader("忘記密碼"),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      buildInputEmail(context),
                    ])),
              ),
              buildBottom(context),
            ])));
  }

  Widget buildInputEmail(BuildContext context) {
    return Column(
      children: [
        loginInput(
          "Email：",
          paddingTop: 16.h,
          hintText: "請輸入Email",
          keyboardType: TextInputType.text,
          initValue: _mEmail,
          focusNode: _emailFocusNode,
          onChanged: (v) {
            _mEmail = v ?? "";
            // updateColor();
          },
          onSaved: (v) {
            _mEmail = v ?? "";
          },
          validator: (msg) {
            return msg == null || msg.isEmpty ? '請輸正確信箱 ' : null;
          },
        )
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      children: [
        bottomButton(context, "寄送驗證信", _color,
            edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h),
            onTap: onTapHandler),
      ],
    );
  }

  void updateColor() {
    if (_mEmail.isNotEmpty) {
      setState(() {
        _color = Color(0xFF214D7C);
        onTapHandler = () async {
          showLoginMessageDialog(
              context,
              LoginDialog(
                  title: "更改預設密碼",
                  content: "您仍在使用系統預設的密碼；為保障您的資料安全，系統將引導您前往更改密碼。",
                  buttonText: "更改密碼"));
          EasyLoading.show();
        };
      });
    } else {
      setState(() {
        _color = Color(0xFFD2D2D2);
        onTapHandler = null;
      });
    }
  }
}
