
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class LaunchScreenPage extends StatelessWidget {
  const LaunchScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      AutoRouter.of(context).replaceNamed('/login');
    });
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.bgColor),
      body: Container(
        width: 400.sp,
        height: 300.sp,
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(width: 160, height: 40, 'assets/images/ihouse_banner.png')),
        // Your content here
      ),
    );
  }
}

