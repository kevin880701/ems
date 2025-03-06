import 'package:ems_app/define.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../resources/app_colors.dart';

class BaselinePieChart extends StatefulWidget {
  const BaselinePieChart(
      {super.key,
      required this.chartColor,
      required this.value,
      required this.icon,
      this.isGradient = false,
      this.isShowBase = false});

  final List<Color> chartColor;
  final String icon;
  final int value;
  final bool? isGradient;
  final bool? isShowBase;

  @override
  State<StatefulWidget> createState() => _BaselinePieChartState();
}

class _BaselinePieChartState extends State<BaselinePieChart> {
  double maxValue = 100;
  int touchedIndex = -1;

@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<GaugePointer> pointers = [
      RangePointer(
        value: widget.value.toDouble(),
        width: 0.22,
        sizeUnit: GaugeSizeUnit.factor,
        animationDuration: 1000,
        animationType: AnimationType.easeOutBack,
        gradient: SweepGradient(
            colors: <Color>[widget.isGradient! ? widget.chartColor[4] : widget.chartColor[0], widget.chartColor[0]],
            stops: <double>[0.25, 0.75]),
        enableAnimation: true,
        cornerStyle: CornerStyle.startCurve,
      ),
      MarkerPointer(
          value: widget.value.toDouble(),
          borderWidth: 2.5,
          color: widget.chartColor[0],
          borderColor: AppColors.white,
          markerHeight: 15,
          markerWidth: 15,
          markerType: MarkerType.circle,
          overlayRadius: 15),
    ];

    // 如果 widget.isShowBase 為 true，添加基線的 MarkerPointer
    if (widget.isShowBase!) {
      pointers.add(
        MarkerPointer(
            value: 10,
            borderColor: AppColors.white,
            borderWidth: 3,
            color: Color(0xFFFF9A9A),
            markerHeight: 15,
            markerWidth: 15,
            markerType: MarkerType.circle,
            overlayRadius: 15),
      );
    }
    return Container(
      height: 56.sp,
      width: 56.sp,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            axisLineStyle: AxisLineStyle(
              thickness: 0.22,
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.bothCurve,
            ),
            radiusFactor: 1,
            minorTicksPerInterval: 4,
            showFirstLabel: false,
            showLastLabel: false,
            showTicks: false,
            showLabels: false,
            maximum: maxValue,
            interval: 1,
            pointers: pointers,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Center(child: getImage(widget.icon, height: 24.sp, width: 24.sp)),
                  positionFactor: 0.1,
                  angle: 0)
            ])
      ]),
    );
  }
}
