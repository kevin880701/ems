import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogTitleBar extends StatefulWidget {
  const DialogTitleBar(
      {super.key,
      required this.title,
      this.leftWidget,
      this.rightWidget,
        this.barColor = AppColors.white,
        this.barIconColor = Brightness.dark});

  final String title;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? barColor;
  final Brightness? barIconColor;

  @override
  State<DialogTitleBar> createState() => _DialogTitleBarState();
}

class _DialogTitleBarState extends BasePageState<DialogTitleBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.sp,
        padding: EdgeInsets.fromLTRB(12.sp, 12.sp, 12.sp, 12.sp),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: getText(widget.title,
                  fontSize: 16.sp, color: AppColors.primaryBlack),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.leftWidget != null
                    ? widget.leftWidget!
                    : Container(
                        width: 0,
                        height: 0,
                      ),
                widget.rightWidget != null
                    ? widget.rightWidget!
                    : Container(
                        width: 0,
                        height: 0,
                      ),
              ],
            ),
          ],
        ));
  }
}
