import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/app_colors.dart';

Widget loginHeader(String title) {
  return Container(
    padding: EdgeInsets.fromLTRB(28.w, 24.h, 0, 0),
    child: Row(
      children: [
        // Container(
        //   alignment: Alignment.topLeft,
        //   width: 8,
        //   height: 28.sp,
        //   color: const Color(0xFF214D7C),
        // ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
          child:
          getText(title, fontSize: 28.sp, color: AppColors.primaryBlack),
        )
      ],
    ),
  );
}
