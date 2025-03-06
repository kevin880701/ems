import 'dart:isolate';
import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/screen/BasePageState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../utils/widgets/login/LoginHeader.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../utils/widgets/login/LoginLogo.dart';
import '../../utils/widgets/login/PasswordInput.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});



  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends BasePageState<ChangePasswordPage> {

  String _password = '';
  String _checkPassword = '';
  Color _color = Color(0xFFD2D2D2);
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _checkPasswordFocusNode = FocusNode();
  late void Function()? onTapHandler;
  bool isPasswordVisible = false;
  bool isCheckPasswordVisible = false;



  @override
  void initState() {
    super.initState();

    updateColor(); // 初始化按鈕顏色
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        updateColor();
      }
    });
    _checkPasswordFocusNode.addListener(() {
      if (!_checkPasswordFocusNode.hasFocus) {
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
              loginHeader("更改密碼"),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      buildInputPassword(context),
                    ])),
              ),
              buildBottom(context),
            ])));
  }


  Widget buildInputPassword(BuildContext context) {
    return Column(
      children: [
        passwordInput(
          "密碼：",
          suffixIconTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          keyboardType: TextInputType.text,
          focusNode: _passwordFocusNode,
          isPasswordVisible: isPasswordVisible,
          paddingTop: 24.h,
          hintText: "請輸入密碼",
          onSaved: (v) {
            _password = v ?? "";
          },
          initValue: _password,
          onChanged: (v) {
            _password = v ?? "";
          },
          validator: (msg) {
            return msg == null || msg.isEmpty ? '請重新再輸入一次密碼' : null;
          },
        ),
        passwordInput(
          "確認密碼：",
          suffixIconTap: () {
            setState(() {
              isCheckPasswordVisible = !isCheckPasswordVisible;
            });
          },
          keyboardType: TextInputType.text,
          focusNode: _checkPasswordFocusNode,
          isPasswordVisible: isCheckPasswordVisible,
          paddingTop: 24.h,
          hintText: "請再次輸入密碼",
          onSaved: (v) {
            _checkPassword = v ?? "";
          },
          initValue: _checkPassword,
          onChanged: (v) {
            _checkPassword = v ?? "";
          },
          validator: (msg) {
            return msg == null || msg.isEmpty ? '請重新再輸入一次密碼' : null;
          },
        )
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      children: [
        bottomButton(context,"確認", _color, edge: EdgeInsets.fromLTRB(28.w, 10.h , 28.w, 16.h),
            onTap: onTapHandler),
      ],
    );
  }

  void updateColor() {
    if (_password.isNotEmpty && _checkPassword.isNotEmpty) {
      setState(() {
        _color = Color(0xFF214D7C);
        onTapHandler = () async {
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
