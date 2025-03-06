import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/fakeData/FakeData.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key, required this.title, required this.content, required this.buttonText});

  final String title;
  final String content;
  final String buttonText;

  @override
  _LoginDialog createState() => _LoginDialog();
}

class _LoginDialog extends State<LoginDialog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r))),
      child: IntrinsicHeight(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0.h),
                child: Center(
                  child: getText(widget.title,
                      fontSize: 16.sp, color: AppColors.primaryBlack),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(40.w, 8.h, 40.w, 0.h),
                    child: Center(
                        child: getText(widget.content,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBlack)))
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 16.h),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).popForced();
                      },
                      child: getText(widget.buttonText,
                          fontSize: 16.sp, color: AppColors.appPrimaryBlue)),
                )),
          ])),
    );
  }
}
