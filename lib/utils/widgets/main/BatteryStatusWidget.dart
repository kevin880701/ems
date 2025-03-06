import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';
import '../chart/pieChart/BaselinePieChart.dart';

class BatteryStatusWidget extends StatefulWidget {
  final String storageName; // 儲能櫃名稱
  final String batteryName; // 電池名稱
  final int batteryPower; // 電池電量%
  final int powerSupply; // 累積供電
  final String batteryStatus; // 供電狀態
  final String healthStatus; // 健康度
  final String temperature; // 電池溫度
  final String operationTime; // 運行時間

  const BatteryStatusWidget({
    super.key,
    required this.storageName,
    required this.batteryName,
    required this.batteryPower,
    required this.powerSupply,
    required this.batteryStatus,
    required this.healthStatus,
    required this.temperature,
    required this.operationTime,
  });

  @override
  _BatteryStatusWidget createState() => _BatteryStatusWidget();
}

class _BatteryStatusWidget extends State<BatteryStatusWidget> {
  int selectedIndex = -1;
  List<double> detailData = [0, 0, 0];
  late Function(bool, List<double>?) onItemTap;
  bool _isChartClicked = false;


  @override
  void initState() {
    super.initState();
    onItemTap = (bool isChartClicked, List<double>? data) {
      setState(() {
        _isChartClicked = isChartClicked;
        if (_isChartClicked) {
          detailData = data!;
        } else {
          detailData = [0, 0, 0]!;
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    var statusTextColor = AppColors.grey;
    var statusBgColor = AppColors.borderGrey;
    if(widget.batteryStatus == AppTexts.charging){
      statusTextColor = AppColors.green;
      statusBgColor = AppColors.milkGreen;
    }else if(widget.batteryStatus == AppTexts.inProgress){
      statusTextColor = AppColors.appPrimaryBlue;
      statusBgColor = AppColors.milkBlue;
    }
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(widget.storageName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                  getText(widget.batteryName, fontSize: 16.sp),
                  Container(
                    padding: EdgeInsets.fromLTRB(4.sp, 2.sp, 4.sp, 2.sp),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(2.sp),
                    ),
                    child: getText(widget.batteryStatus, fontSize: 12.sp, color: statusTextColor),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      getText(widget.batteryPower.toString(), fontSize: 28.sp),
                      getText(AppTexts.percent, fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.grey),
                    ],
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  BaselinePieChart(
                    value: widget.batteryPower,
                    chartColor: [
                      AppColors.essGreen,
                      colorOpacity(AppColors.essGreen, 0.8),
                      colorOpacity(AppColors.essGreen, 0.6),
                      colorOpacity(AppColors.essGreen, 0.4),
                      colorOpacity(AppColors.essGreen, 0.2),
                    ],
                    icon: 'battery.png',
                    isGradient: false,
                  )
                ],
              ))
            ],
          ),
          SizedBox(
            height: 8.sp,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  fieldTitleWidget("flash.png", AppTexts.powerSupply),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 0, 4.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getText(formatValue(widget.powerSupply.toDouble()), fontSize: 24.sp, height: 1),
                        SizedBox(
                          width: 4.sp,
                        ),
                        getText(formatUnit(widget.powerSupply.toDouble()),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                            textAlign: TextAlign.end,
                            height: 1),
                        getText(AppTexts.kWh,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                            textAlign: TextAlign.end,
                            height: 1),
                      ],
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  fieldTitleWidget("temperature_icon.png", AppTexts.batteryTemperature),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 0, 4.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getText(widget.temperature, fontSize: 24.sp, height: 1),
                        SizedBox(
                          width: 4.sp,
                        ),
                        getText(AppTexts.degreesCelsius,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                            textAlign: TextAlign.end,
                            height: 1),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
          SizedBox(height: 24.sp),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  fieldTitleWidget("health_icon.png", AppTexts.health),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 0, 4.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getText(
                          widget.healthStatus,
                          textAlign: TextAlign.center,
                          fontSize: 24.sp,
                          color: (widget.healthStatus == AppTexts.abnormal)?AppColors.red:AppColors.appPrimaryBlack
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              // Expanded(  // 因為目前查不到已執行時間，故先註解
              //   child: Column(
              //     children: [
              //       fieldTitleWidget("time_icon.png", AppTexts.operationTime),
              //       Container(
              //         padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 0, 4.sp),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           children: [
              //             getText("56", fontSize: 24.sp, height: 1),
              //             SizedBox(
              //               width: 4.sp,
              //             ),
              //             getText(AppTexts.day,
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.grey,
              //                 textAlign: TextAlign.end,
              //                 height: 1),
              //             SizedBox(
              //               width: 4.sp,
              //             ),
              //             getText("12", fontSize: 24.sp, height: 1),
              //             SizedBox(
              //               width: 4.sp,
              //             ),
              //             getText(AppTexts.hour,
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w400,
              //                 color: AppColors.grey,
              //                 textAlign: TextAlign.end,
              //                 height: 1),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

Widget fieldTitleWidget(String icon, String text) {
  return Row(
    children: [
      getImageIcon(icon, width: 20.sp, height: 20.sp, color: AppColors.grey),
      SizedBox(
        width: 4.w,
      ),
      getText(text, fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
    ],
  );
}
