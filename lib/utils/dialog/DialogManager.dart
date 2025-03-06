
import 'dart:async';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tuple/tuple.dart';
import '../../resources/app_colors.dart';

void showDefaultDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget);
}

Future<dynamic> showDefaultDialog2(BuildContext context, Widget widget) {
  return showDialogBox(context, child: widget);
}

void showDeleteAccountDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget);
}

void showSearchFilterDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget, alignment: Alignment.bottomCenter);
}

void showModeChooseDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget);
}

void showLoginMessageDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget);
}

void showPickerDateDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget, alignment: Alignment.bottomCenter);
}

void showSetTimeDialogDialog(BuildContext context, Widget widget) {
  showDialogBox(context, child: widget, alignment: Alignment.bottomCenter);
}

Future<Tuple2> showChooseTimeDialog(BuildContext context, Widget widget) {
  Completer<Tuple2> completer = Completer<Tuple2>();
   showDialogBox(context, child: widget, alignment: Alignment.bottomCenter).then((value) {
     completer.complete(value);
  });
  return completer.future;
}

Future<T?> showDialogBox<T>(
  BuildContext context, {
  Widget? child,
  Alignment? alignment = Alignment.center,
}) async {
  var currentStatusBarBgColor = Define.instance.statusBarBgColor;
  var currentStatusBarIconColor = Define.instance.statusBarIconColor;


  EasyLoading.dismiss();

  return await showDialog(
    context: context,
    useSafeArea: false,
    builder: (BuildContext context) {
      return child!!; // 顯示自定義的對話框
    },
  ).then((value) {
    FocusScope.of(context).unfocus();
    return value;
  });
}
