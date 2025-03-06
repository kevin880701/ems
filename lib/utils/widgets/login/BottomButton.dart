import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';

Widget bottomButton(BuildContext context, String btnTitle, Color color,
    {Function()? onTap,
    EdgeInsets? edge,
    bool enabled = true,
      Color? textColor}) {
  return Padding(
      padding: edge ?? EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 26.h),
      child: InkWell(
          onTap: onTap,
          child: Container(
            width: 340.w,
            height: 48.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x11E7EAEE),
                  blurRadius: 31.56.r,
                  offset: Offset(0, 3.16.h),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
                child: getText(btnTitle,
                    fontSize: 18.sp, color: textColor ?? AppColors.white)),
          )));
}

