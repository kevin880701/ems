import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../widget/DialogTitleBar.dart';

class DefaultDialog extends StatefulWidget {
  DefaultDialog({
    super.key,
    required this.title,
    required this.description,
    this.leftButtonText = AppTexts.cancel,
    this.rightButtonText = AppTexts.confirm,
    this.leftOnTap,
    this.rightOnTap,
  });

  final String title;
  final String description;
  String leftButtonText;
  String rightButtonText;
  Function()? leftOnTap;
  Function()? rightOnTap;

  @override
  _DefaultDialog createState() => _DefaultDialog();
}

class _DefaultDialog extends State<DefaultDialog> {
  void _defaultOnTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 48.sp),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.sp, 20.sp, 16.sp, 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DialogTitleBar(
                title: widget.title,
              ),
              SizedBox(
                height: 4.sp,
              ),
              getText(widget.description, fontWeight: FontWeight.w400, fontSize: 14.sp),
              SizedBox(
                height: 16.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (widget.leftOnTap == null) ? _defaultOnTap : widget.leftOnTap,
                    child: getText(widget.leftButtonText, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: (widget.rightOnTap == null) ? _defaultOnTap : widget.rightOnTap,
                    child: getText(widget.rightButtonText, fontSize: 16.sp, color: AppColors.lightBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
