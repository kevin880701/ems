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
import '../../../../viewModel/EnergyStorageViewModel.dart';

class SymmetricBarChartInfo extends StatefulWidget {
  const SymmetricBarChartInfo({
    super.key,
    required this.times,
    required this.values,
    required this.titles,
    required this.chartInfo,
    required this.timeFormat,
  });

  final List<String> times;
  final List<double> values;
  final List<String> titles;
  final ChartInfo chartInfo;
  final String timeFormat;

  @override
  State<SymmetricBarChartInfo> createState() => SymmetricBarChartInfoState();
}

class SymmetricBarChartInfoState extends BaseChartDetailState<SymmetricBarChartInfo> {
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  String time = "";
  List<String> times = [];
  List<double> values = [];
  List<String> titles = [];
  String timeFormat = "day";
  double value = 0;

  @override
  void initState() {
    super.initState();
    times = widget.times;
    values = widget.values;
    titles = widget.titles;
    timeFormat = widget.timeFormat;
  }

  @override
  void updateData(List<String> times, List<double> values, ChartInfo chartInfo, String timeFormat) {
    setState(() {
      this.times = times;
      this.values = values;
      this.timeFormat = timeFormat;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (times.isNotEmpty) {
      // 顯示的時間要再加上時區秒數
      DateTime dateTime = DateTime.parse(times[0]);
      switch (timeFormat) {
        case "day":
          time = DateFormat('HH:mm').format(dateTime);
        case "month":
          time = DateFormat('MM-dd').format(dateTime);
        case "year":
          time = DateFormat("MM月").format(dateTime);
        default:
          time = DateFormat('HH:mm').format(dateTime);
      }
    } else {
      time = "";
    }
    if (values.length > 1) {
      value = values.isNotEmpty ? values[1] : 0;
    }

    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 16.sp),
        color: AppColors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getText(AppTexts.time, fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.primaryBlack),
                SizedBox(
                  width: 8.sp,
                ),
                getText(time, fontSize: 18.sp, color: AppColors.primaryBlack),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4.sp),
              height: 1.sp,
              color: AppColors.borderGrey,
            ),
            informationTableWidget("市電-供電", values[0].toStringAsFixed(2), Color(0xFFA6C4E3)),
            informationTableWidget("綠電-供電", values[1].toStringAsFixed(2), Color(0xFFB1DFAD)),
            informationTableWidget("儲能櫃", values[2].toStringAsFixed(2), Color(0xFFFFAA7A),
                isTwoRow: true,
                twoValue: [values[2].toStringAsFixed(2), values[3].toStringAsFixed(2)],
                twoTitle: ["充電", "供電"])
          ],
        ));
  }

  Widget informationTableWidget(String title, String value, Color color,
      {bool isTwoRow = false, List<String>? twoValue, List<String>? twoTitle}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 4.sp,
              height: isTwoRow ? 38.sp : 16.sp,
              color: color,
            ),
            SizedBox(width: 8),
            getText(title, fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryBlack),
            SizedBox(width: 8),
            isTwoRow
                ? Expanded(
                    child: Column(
                    children: [
                      Row(
                        children: [
                          getImage('charge.png', height: 16.sp, width: 16.sp),
                          SizedBox(width: 8),
                          getText(twoTitle![0], fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors
                              .primaryBlack),
                          Spacer(),
                          getText(twoValue![0],
                              fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryBlack),
                          SizedBox(width: 8),
                          getText(
                            "kWh",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8.sp, 0, 8.sp),
                        width: double.infinity,
                        child: getDashedLine(
                          color: AppColors.borderGrey,
                        ),
                      ),
                      Row(
                        children: [
                          getImage('power_supply.png', height: 16.sp, width: 16.sp),
                          SizedBox(width: 8),
                          getText(twoTitle![1], fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors
                              .primaryBlack),
                          Spacer(),
                          getText(twoValue![1],
                              fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryBlack),
                          SizedBox(width: 8),
                          getText(
                            "kWh",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          )
                        ],
                      ),
                    ],
                  ))
                : Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      getText(value, fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryBlack),
                      SizedBox(width: 8),
                      getText(
                        "kWh",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ],
                  )),
            SizedBox(width: 8),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 8.sp, 0, 8.sp),
          width: double.infinity,
          child: getDashedLine(
            color: AppColors.borderGrey,
          ),
        ),
      ],
    );
  }
}
