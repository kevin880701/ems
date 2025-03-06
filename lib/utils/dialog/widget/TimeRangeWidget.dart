
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import '../../../data/Params.dart';
import '../../../define.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';

Widget timeRangeWidget(String type, String? startTime, String? endTime, VoidCallback? onTap) {
  return Column(
    children: [
      getText(type, fontSize: 16.sp, color: (type == AppTexts.charge) ? AppColors.green : AppColors.orange),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(AppTexts.start, fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.grey),
          SizedBox(
            width: 16.sp,
          ),
          getText(AppTexts.end, fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.grey)
        ],
      ),
      SizedBox(
        height: 8.sp,
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.sp),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: AppColors.borderLightGrey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getText(formatModeTime(startTime), fontSize: 24.sp),
              getImageIcon("arrow_right2.png", width: 16.sp, height: 16.sp, color: AppColors.grey),
              getText(formatModeTime(endTime), fontSize: 24.sp)
            ],
          ),
        ),
      ),
    ],
  );
}