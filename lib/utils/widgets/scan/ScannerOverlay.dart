
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    var strokeWidth = 4.sp;
    var extend = borderRadius + 24.0;
    var arcSize = Size.square(borderRadius * 2);
    var pi = 3.14;



    // // 繪製白色背景
    // final paint = Paint()..color = colorOpacity(Colors.black, 0.4);
    //
    // // 繪製白色背景
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, size.width, size.height),
    //   paint,
    // );

    final rectLinePath = Path();
    for (var i = 0; i < 4; i++) {
      final isLeftCorner = i & 1 == 0;
      final isTopCorner = i & 2 == 0;
      rectLinePath
        ..moveTo(isLeftCorner ? scanWindow.left : scanWindow.left + scanWindow.width, isTopCorner ? scanWindow.top +
            extend : scanWindow.top + scanWindow.width -
            extend)
        ..arcTo(
            Offset(isLeftCorner ? scanWindow.left : scanWindow.left + scanWindow.width - arcSize.width,
                isTopCorner ? scanWindow.top : scanWindow.top + scanWindow.width - arcSize.width) &
            arcSize,
            isLeftCorner ? pi : pi * 2,
            isLeftCorner == isTopCorner ? pi / 2 : -pi / 2,
            false)
        ..lineTo(isLeftCorner ? scanWindow.left + extend : scanWindow.left + scanWindow.width - extend, isTopCorner ? scanWindow.top
            : scanWindow.top + scanWindow
            .width);
    }
    final rectLinePaint = Paint()
      ..color = AppColors.lightBlue
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;


    // 要挖空的位置
    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backGroundPath = Path()..addRect(Rect.largest) ;

    final backGroundPaint = Paint()
    ..color = Colors.black.withOpacity(0.4)
    ..style = PaintingStyle.fill
    ..blendMode = BlendMode.dstOut;

    final backGroundWithCutout = Path.combine(PathOperation.difference, backGroundPath, cutoutPath);

    canvas.drawPath(backGroundWithCutout, backGroundPaint);
    canvas.drawPath(rectLinePath, rectLinePaint);  //RELEASE
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}
