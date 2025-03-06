import 'package:flutter/material.dart';

import '../../define.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.width = 16,
    this.height = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double width;
  final double height;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        getText(text, fontSize: 12.sp, fontWeight: FontWeight.w600, color: textColor),
      ],
    );
  }
}
