import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget thirdPartyButton(BuildContext context,
    {required String logo,
    required String btnTitle,
    required Color backgroundColor,
    required Color textColor,
    Function()? onTap,
    EdgeInsets? edge,
    bool enabled = true}) {
  return Padding(
      padding: edge ?? EdgeInsets.fromLTRB(28.w, 8.h, 28.w, 26.h),
      child: InkWell(
          onTap: onTap,
          child: Container(
            width: 318.sp,
            height: 48.sp,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: backgroundColor,
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
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getImage(logo, width: 28, height: 28),
                const SizedBox(width: 10),
                getText(btnTitle,fontSize: 16.sp,color: textColor),
              ],
            )),
          )));
}
