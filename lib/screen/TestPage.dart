import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/app_colors.dart';
import '../utils/widgets/datePicker/library/date_picker.dart';
import '../utils/widgets/datePicker/library/date_picker_manager.dart';

@RoutePage()
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends BasePageState<TestPage> {
  final DateRangePickerController _controller = DateRangePickerController();
  late void Function()? onTapHandler;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // WebManager.instance.getDeviceGetById(DeviceGetByIdRequest(deviceId: '33997297-2191-4cb4-bd96-12dccec17dcb'));

    return InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Container(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
          color: AppColors.white,
          child: Center(
              child: Column(
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              // // BaselineBarChart(),
              // SizedBox(
              //   height: 50,
              // ),
              // EnergyDynamicsWidget(title: "JYE 台中廠", subTitle: "即時能源流動圖"),
              SfDateRangePicker(
                showNavigationArrow: false,
                showTodayButton: true,
                todayHighlightColor: AppColors.appPrimaryBlue,
                controller: _controller,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                selectionColor: AppColors.appPrimaryBlue,
                monthFormat: 'MM',
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(color: AppColors.primaryBlack, fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    todayTextStyle: TextStyle(color: AppColors.appPrimaryBlue, fontSize: 12.sp),
                    todayCellDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Color(0xFFEDF5FD), shape: BoxShape.rectangle),
                    blackoutDateTextStyle: TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough)),
                monthViewSettings:
                    DateRangePickerMonthViewSettings(showTrailingAndLeadingDates: true, enableSwipeSelection: false),
              ),
              // Column(children: <Widget>[
              //   Expanded(
              //       child: ListView(children: <Widget>[
              //     SizedBox(
              //       height: 100,
              //       child: cardView,
              //     )
              //   ])),
              //   Expanded(child: Container())
              // ])
            ],
          )),
        )));
  }
}
