import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnergyStorageTitleBar extends StatefulWidget {
  const EnergyStorageTitleBar(
      {super.key,
      required this.title,
      this.statusBarBgColor = AppColors.appPrimaryBlack,
      this.statusBarIconColor = Brightness.light,
      this.onTap});

  final String title;
  final Color? statusBarBgColor;
  final Brightness? statusBarIconColor;
  final Function()? onTap;

  @override
  State<EnergyStorageTitleBar> createState() => _EnergyStorageTitleBarState();
}

class _EnergyStorageTitleBarState extends BasePageState<EnergyStorageTitleBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: widget.statusBarBgColor,
      ),
      padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 0.sp, 16.sp),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            getText(widget.title, fontSize: 18.sp, color: AppColors.white, textAlign: TextAlign.center),
            getImageIcon("arrow_down.png", height: 28.sp, width: 28.sp, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
