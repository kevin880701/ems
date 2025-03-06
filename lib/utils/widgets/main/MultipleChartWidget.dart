import 'package:ems_app/data/apiRequest/historyValueStatistics/HistoryValueStatisticsParams.dart';
import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/net/remote/ApiEndPoint.dart';
import 'package:ems_app/repository/AccountRepository.dart';
import 'package:ems_app/resources/app_texts.dart';
import 'package:ems_app/utils/widgets/chart/SlideSymmetricBarChart.dart';
import 'package:ems_app/utils/widgets/chart/SymmetricBarChart.dart';
import 'package:ems_app/utils/widgets/chart/info/SymmetricBarChartInfo.dart';
import 'package:ems_app/utils/widgets/chart/pieChart/BaselinePieChart.dart';
import 'package:ems_app/utils/widgets/main/EnergyDynamicsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../../data/chart/ChartConfig.dart';
import '../../../resources/app_colors.dart';
import '../../../screen/BaseChartDetailState.dart';
import '../../../viewModel/EnergyStorageViewModel.dart';
import '../../dialog/DialogManager.dart';
import '../../dialog/window/PickerDateDialog.dart';

enum ChartStatus { error, success, loading }

class MultipleChartWidget extends StatefulWidget {
  final String title;
  final String devid;
  final String subTitle;
  final String dayPower;
  final String monthPower;
  final String yearPower;

  const MultipleChartWidget({
    super.key,
    required this.title,
    required this.devid,
    required this.subTitle,
    required this.dayPower,
    required this.monthPower,
    required this.yearPower,
  });

  @override
  _MultipleChartWidget createState() => _MultipleChartWidget();
}

class _MultipleChartWidget extends BasePageState<MultipleChartWidget> with SingleTickerProviderStateMixin {
  GlobalKey<BaseChartDetailState> chartDetailStateKey = GlobalKey<BaseChartDetailState>();
  int selectedIndex = -1;
  late Function(bool, List<double>, List<String>, List<String>) onItemTap;
  bool _isChartClicked = false;
  bool isFirst = true;
  late ChartConfig chartConfig;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  late String startTime;
  late String endTime;
  late List<String> fields;
  late int interval;
  late EnergyListData energyDataList = EnergyListData(energyList: []);
  String date = ''; // 顯示選擇的日期
  var currentDevId = '';
  String timeFormat = "day";
  ChartStatus chartStatus = ChartStatus.loading;

  // 獲取當前日期時間
  DateTime now = DateTime.now();
  late DateTime? chooseDay;
  String? chooseMonth;
  String? chooseYear;

  // dialog param
  int dateSwitcherIndex = 0;

  // 目前打API取到的時間比較久，而且會不一定。為了避免後面的資料被前面取代需用dateSwitcherIndex來識別。dateSwitcherIndex只會一直遞增
  int _lastRequestId = 0;

  // 點擊圖表後顯示的細節資料
  List<String> detailTimes = [];
  List<double> detailValues = [];
  List<String> detailTitles = [];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    // 要去掉時分秒
    now = now.subtract(Duration(
        hours: now.hour,
        minutes: now.minute,
        seconds: now.second,
        milliseconds: now.millisecond,
        microseconds: now.microsecond));

    date = DateFormat("yyyy-MM-dd").format(now);
    chooseDay = now;

    chartConfig = ChartConfig.fromWidgetType("");
    interval = 2;

    onItemTap = (bool isChartClicked, List<double> values, List<String> times, List<String> titles) {
      setState(() {
        _isChartClicked = isChartClicked;
        if (_isChartClicked) {
          detailTimes = times;
          detailValues = values;
          detailTitles = titles;
          chartDetailStateKey.currentState?.updateData(detailTimes, detailValues, chartConfig.chartInfo, timeFormat);
        } else {
          detailTimes.clear();
          detailValues.clear();
          detailTitles.clear();
        }
      });
    };

    _chooseDate(now, null, null, dateSwitcherIndex);
  }

  @override
  Widget build(BuildContext context) {
    final AccountRepository accountRepository = AccountRepository.instance;

    return Consumer<EnergyStorageViewModel>(builder: (context, energyStorageViewModel, _) {
      if (energyStorageViewModel.updateStatus == UpdateStatus.updateData) {
        fetchData();
        _isChartClicked = false;
      }

      return Column(children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.white,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              getText(widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
              getText('太陽能發電', fontSize: 16.sp, color: AppColors.primaryBlack),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                        "今日發電",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        textAlign: TextAlign.end,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          getText(widget.dayPower, fontSize: 24.sp, height: 1),
                          SizedBox(
                            width: 4.sp,
                          ),
                          getText(AppTexts.kWh,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                              textAlign: TextAlign.end,
                              height: 1),
                        ],
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                        "本月發電",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        textAlign: TextAlign.end,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          getText(widget.monthPower, fontSize: 24.sp, height: 1),
                          SizedBox(
                            width: 4.sp,
                          ),
                          getText(AppTexts.kWh,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                              textAlign: TextAlign.end,
                              height: 1),
                        ],
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 16.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                    "今年發電",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    textAlign: TextAlign.end,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      getText(widget.yearPower, fontSize: 24.sp, height: 1),
                      SizedBox(
                        width: 4.sp,
                      ),
                      getText(AppTexts.kWh,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                          textAlign: TextAlign.end,
                          height: 1),
                    ],
                  )
                ],
              )
            ])),
        EnergyDynamicsWidget(baseUrl: ApiEndPoint.ipPort,devid: widget.devid, token: accountRepository.token,),
        SizedBox(height: 16.sp),
        GestureDetector(
            onTap: () {
              setState(() {
                _isChartClicked = false;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(widget.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    child: getText(widget.subTitle, fontSize: 16.sp, color: AppColors.primaryBlack),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        getText(
                                            (energyStorageViewModel.batteryInformation != null)
                                                ? (double.tryParse(energyStorageViewModel.batteryInformation?.vals?.brBattery ?? '0')?.toInt().toString() ?? '0')
                                                : '0'
                                            ,
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryBlack),
                                        getText(AppTexts.percent,
                                            textAlign: TextAlign.right,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 84.sp,
                          width: 84.sp,
                          child: BaselinePieChart(value: (energyStorageViewModel.batteryInformation != null)
                              ? (energyStorageViewModel.batteryInformation!.vals?.brBattery != null &&
                              (energyStorageViewModel.batteryInformation!.vals!.brBattery != null))
                              ? energyStorageViewModel.batteryInformation!.vals!.brBattery!.stringToInt() ?? 0
                              : 0
                              : 0, chartColor: chartConfig.chartInfo.colors, icon: chartConfig.chartInfo.iconPath),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  if (chartConfig.hasChart)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: dateButtonWidget(context),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            IgnorePointer(
                              ignoring: false,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addSubtractClick(false);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(18.sp),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: AppColors.borderGrey, width: 1)),
                                    child: getImageIcon("arrow_left.png",
                                        height: 18.sp, width: 18.sp, color: AppColors.grey),
                                  )),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            IgnorePointer(
                              ignoring: false,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addSubtractClick(true);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(18.sp),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: AppColors.borderGrey, width: 1)),
                                    child: getImageIcon("arrow_right.png",
                                        height: 18.sp, width: 18.sp, color: AppColors.grey),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        _buildChart(),
                      ],
                    ),
                  if (chartConfig.chartType != null)
                    Visibility(
                      visible: (chartConfig.isAlwaysShowDetail || (_isChartClicked && !chartConfig.isAlwaysShowDetail)),
                      child: SymmetricBarChartInfo(
                          key: chartDetailStateKey,
                          values: detailValues,
                          titles: detailTitles,
                          times: detailTimes,
                          chartInfo: chartConfig.chartInfo,
                          timeFormat: timeFormat),
                    ),
                ],
              ),
            ))
      ]);
    });
  }

  Widget _buildChart() {
    switch (chartStatus) {
      case ChartStatus.success:
        return Container(
          child: SlideSymmetricBarChart(
            onItemTap: onItemTap,
            isChartClicked: _isChartClicked,
            energyDataList: energyDataList,
            height: MediaQuery.of(context).size.width * 0.5,
          ),
        );
      case ChartStatus.loading:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getText(AppTexts.chartLoading, fontSize: 20),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: _controller.value < 0.3 ? 0 : 1,
                        child: getText(".", fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Opacity(
                        opacity: _controller.value < 0.6 ? 0 : 1,
                        child: getText(".", fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Opacity(
                        opacity: _controller.value < 0.9 ? 0 : 1,
                        child: getText(".", fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      case ChartStatus.error:
      default:
        return GestureDetector(
          onTap: () {
            fetchData();
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getText(AppTexts.chartLoadingFailed, fontSize: 20, color: Colors.red),
                getImageIcon('reload.png', color: AppColors.red, width: 28.sp, height: 28.sp),
              ],
            ),
          ),
        );
    }
  }

  Widget iconButtonWidget(String image, Color color) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          getImageIcon(image, width: 24.w, height: 24.h, color: color),
        ],
      ),
    );
  }

  Widget dateButtonWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _isChartClicked = false;
        showPickerDateDialog(
          context,
          PickerDateDialog(
            chooseDay: chooseDay,
            chooseMonth: chooseMonth,
            chooseYear: chooseYear,
            chooseDate: _chooseDate,
            dateSwitcherIndex: dateSwitcherIndex,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderGrey),
        ),
        child: Row(
          children: [
            getImageIcon('calendar.png', width: 24.w, height: 24.h, color: AppColors.grey),
            SizedBox(
              width: 8.w,
            ),
            getText(date, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.primaryBlack),
          ],
        ),
      ),
    );
  }

  void _chooseDate(DateTime? chooseDay, String? chooseMonth, String? chooseYear, int dateSwitcherIndex) {
    setState(() {
      this.dateSwitcherIndex = dateSwitcherIndex;
      late Tuple2<String, String> dateRange;
      if (chooseDay != null) {
        print("chooseDay：${chooseDay}");
        timeFormat = "day";
        this.chooseDay = chooseDay;
        date = DateFormat("yyyy-MM-dd").format(chooseDay);
        interval = 2;
        dateRange = dayConvertRequest(
            chooseDay,
            convertTimezoneToSeconds(
                energyStorageViewModel.deviceList[energyStorageViewModel.deviceListIndex].attrs?.timezoneVal));
        fields = ["E_KWHHour:max", "PV_KWHHour:max", "B_In_KWHHour:max", "B_Out_KWHHour:max"];
      } else if (chooseMonth != null) {
        print("chooseMonth：${chooseMonth}");
        timeFormat = "month";
        this.chooseMonth = chooseMonth;
        dateRange = monthConvertRequest(
            chooseMonth,
            convertTimezoneToSeconds(
                energyStorageViewModel.deviceList[energyStorageViewModel.deviceListIndex].attrs?.timezoneVal));
        date = chooseMonth + " 　";
        interval = 3;
        fields = ["E_KWHDay:max", "PV_KWHDay:max", "B_In_KWHDay:max", "B_Out_KWHDay:max"];
      } else if (chooseYear != null) {
        print("chooseYear：${chooseYear}");
        timeFormat = "year";
        this.chooseYear = chooseYear;
        dateRange = yearConvertRequest(
            chooseYear,
            convertTimezoneToSeconds(
                energyStorageViewModel.deviceList[energyStorageViewModel.deviceListIndex].attrs?.timezoneVal));
        date = chooseYear + " 　 　";
        interval = 4;
        fields = ["E_KWHMonth:max", "PV_KWHMonth:max", "B_In_KWHMonth:max", "B_Out_KWHMonth:max"];
      }
      this.chooseDay = chooseDay;
      this.chooseMonth = chooseMonth;
      this.chooseYear = chooseYear;

      startTime = dateRange.item1;
      endTime = dateRange.item2;
      fetchData();
    });
  }

  void fetchData() async {
    setState(() {
      energyStorageViewModel.updateStatus = UpdateStatus.updateChart;
      energyDataList = EnergyListData(energyList: []);
      chartStatus = ChartStatus.loading;
      // 持續遞增識別值
      ++_lastRequestId;

      energyStorageViewModel.getChartData(startTime, endTime, fields, interval, _lastRequestId, convertTimezoneToSeconds(
          energyStorageViewModel.deviceList[energyStorageViewModel.deviceListIndex].attrs?.timezoneVal)).then((response) {
        if (response.energyListData != null && response.lastRequestId == _lastRequestId) {
          energyDataList = response.energyListData!;
          chartStatus = ChartStatus.success;
        } else if (response.lastRequestId == _lastRequestId) {
          chartStatus = ChartStatus.error;
        }
        energyStorageViewModel.notifyListeners();

      });
    });
  }

  void addSubtractClick(bool isAdd) {
    setState(() {
      _isChartClicked = false;
      if (timeFormat == "day") {
        DateTime dateTime = DateTime.parse(date);
        DateTime changeDate = isAdd ? dateTime.add(Duration(days: 1)) : dateTime.subtract(Duration(days: 1));
        _chooseDate(changeDate, null, null, dateSwitcherIndex);
      } else if (timeFormat == "month") {
        DateTime dateTime = DateTime.parse(date.substring(0, 7) + '-01');
        DateTime changeDate =
            isAdd ? DateTime(dateTime.year, dateTime.month + 1) : DateTime(dateTime.year, dateTime.month - 1);
        String formattedDate = DateFormat('yyyy-MM').format(changeDate);
        _chooseDate(null, formattedDate, null, dateSwitcherIndex);
      } else if (timeFormat == "year") {
        int year = int.parse(date.substring(0, 4));
        int changeDate = isAdd ? year + 1 : year - 1;
        _chooseDate(null, null, changeDate.toString(), dateSwitcherIndex);
      }
    });
  }
}
