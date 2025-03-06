import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/app_colors.dart';

Widget subTitleWidget(String text, String icon, {bool? isShowArrow = false}) {
  return Container(
    child: Row(
      children: [
        getImageIcon(icon, width: 24.sp, height: 24.sp, color: AppColors.grey),
        SizedBox(
          width: 4.sp,
        ),
        getText(text,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: AppColors.primaryBlack),
        (isShowArrow!
            ? getImageIcon('arrow_down.png',
                width: 28.sp, height: 28.sp, color: AppColors.grey)
            : Container(width: 28.sp, height: 28.sp)),
      ],
    ),
  );
}
