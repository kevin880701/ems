import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginLogo() {
  return Container(
    // alignment: Alignment.topLeft,
    padding: EdgeInsets.fromLTRB(0, 48.h, 0, 48.h),
    child: SizedBox(
        width: 144.w, height: 36.h, child: getImage('ihouse_banner.png')),
  );
}
