import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleBar2 extends StatefulWidget {
  const TitleBar2(
      {super.key,
      required this.title,
      this.leftWidget,
      this.rightWidget,
      this.barColor = AppColors.white,});

  final String title;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? barColor;

  @override
  State<TitleBar2> createState() => _TitleBar2State();
}

class _TitleBar2State extends BasePageState<TitleBar2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
        color: widget.barColor,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: getText(widget.title, fontSize: 18.sp),
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
