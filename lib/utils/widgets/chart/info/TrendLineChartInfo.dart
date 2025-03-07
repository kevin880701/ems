import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../data/chart/ChartInfo.dart';
import '../../../../screen/BaseChartDetailState.dart';

class TrendLineChartInfo extends StatefulWidget {
  const TrendLineChartInfo({
    super.key,
    required this.times,
    required this.values,
    required this.chartInfo,
    required this.timeFormat,
  });

  final List<String> times;
  final List<double> values;
  final ChartInfo chartInfo;
  final String timeFormat;

  @override
  State<TrendLineChartInfo> createState() => TrendLineChartInfoState();
}

class TrendLineChartInfoState extends BaseChartDetailState<TrendLineChartInfo> {
  String time = "";
  List<String> times = [];
  List<double> values = [];
  String timeFormat = "day";
  double value = 0;
  double baseValue = 0;

  @override
  void initState() {
    super.initState();
    initDate(widget.times, widget.values, widget.timeFormat);
  }

  @override
  void updateData(List<String> times, List<double> values, ChartInfo chartInfo,
      String timeFormat) {
    setState(() {
      initDate(times, values, timeFormat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 16.sp),
        color: AppColors.white,
        child: Column(
          children: [
            for (int i = 0; i < values.length; i++)
              item(times[i], values[i], widget.chartInfo.unit)
          ],
        ));
  }

  Widget item(String time, double value, String unit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        getText(time,
            fontSize: 20.sp,
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w400),
        Row(
          children: [
            getText(formatValue(value).toString(),
                fontSize: 20.sp,
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.w400),
            SizedBox(
              width: 4.sp,
            ),
            getText(unit,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.grey)
          ],
        ),
      ],
    );
  }

  void initDate(
      List<String> newTimes, List<double> newValues, String newTimeFormat) {
    times.clear();
    values.clear();
    if (newTimes.isNotEmpty && newValues.isNotEmpty) {
      // 要把時間轉成對應格式
      for (int i = 0; i < newTimes.length; i++) {
        String time = newTimes[i];
        if (newTimes[i] != "") {
          DateTime dateTime = DateTime.parse(time);
          print("####：${dateTime}");
          switch (newTimeFormat) {
            case "day":
              time = DateFormat('HH:mm').format(dateTime);
            case "month":
              time = DateFormat('yyyy-MM-dd').format(dateTime);
            case "year":
              time = DateFormat("yyyy-MM").format(dateTime);
            default:
              time = DateFormat('HH:mm').format(dateTime);
          }
          times.add(time);
        }
        if (newValues[i] != null) {
          values.add(newValues[i]);
        }
      }
    }
  }
}
