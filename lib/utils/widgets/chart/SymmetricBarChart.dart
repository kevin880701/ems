
import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/define.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';
import '../Indicator.dart';

class SymmetricBarChart extends StatefulWidget {
  const SymmetricBarChart(
      {super.key,
        required this.onItemTap,
        required this.isChartClicked,
        required this.energyDataList,
        this.height = 400.0});

  final Function(bool, List<double>, List<String>, List<String>) onItemTap;
  final bool isChartClicked;
  final EnergyListData energyDataList;
  final double height;

  @override
  State<StatefulWidget> createState() => _SymmetricBarChartState();
}

class _SymmetricBarChartState extends State<SymmetricBarChart> {
  double barsWidth = 4.0; // 長條圖長條寬度
  late double barsSpace; // 長條圖長條間距
  double maxYValue = 0.0001; // 圖表Y軸最大值
  late EnergyListData energyDataList;
  Function(bool, List<double>, List<String>, List<String>)? onItemTap =
      (bool isTapped, List<double>? data, List<String> times, List<String> titles) {};


  @override
  void updateChart(EnergyListData energyDataList, EnergyListData? secondEnergyDataList) {
    setState(() {
      this.energyDataList = widget.energyDataList;
    });
  }

  // 長條圖資料
  List<BarChartGroupData> barDataList = [];

  // 長條圖值列表（用於點擊後回傳值）
  List<List<double>> barValueList = [];

  // 時間列表（用於點擊後回傳值）
  List<String> timeList = [];
  int touchedIndex = -1;

  // 標題列表（用於點擊後回傳值）
  List<String> titleList = [];

  @override
  void initState() {
    super.initState();
    onItemTap = widget.onItemTap;
    energyDataList = widget.energyDataList;
  }

  @override
  void didUpdateWidget(covariant SymmetricBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 當 isChartClicked 變為 false 時，也就是圖表外部被點擊時，將 touchedIndex 設定為 -1取消圖表的點擊效果
    if (!widget.isChartClicked!) {
      setState(() {
        touchedIndex = -1;
      });
    }
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    String text = '';
    if (barDataList.length == 8) {
      text = extractHour(timeList[value.toInt()]);
    } else if (barDataList.length >= 28 && barDataList.length <= 31) {
      if (value < 25) {
        // 當 value 小於 25 時
        if ((value + 1) % 5 == 0 || value == barDataList.length - 1 || value == 0) {
          text = addLeadingZero((value + 1.0).toInt().toString());
        }
      } else if (value == barDataList.length - 1) {
        // 當 value 等於 barDataList.length 時
        text = addLeadingZero((value + 1.0).toInt().toString());
      }
    } else if (barDataList.length == 12) {
      text = (value.toInt() + 1).toString();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: getText(text, fontSize: 10.sp, color: AppColors.primaryBlack),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: getText(double.parse(meta.formattedValue).toStringAsFixed((timeList.length == 8)? 1: 0),
            fontSize: 8.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  BarChartGroupData generateGroup(
      int x, double value1, double value2, double value3, double value4,
      {bool isSecondChart = false}) {
    final sum = value1 + value2 + value4;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: -value3,
          toY: sum,
          width: barsWidth,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          rodStackItems: [

            BarChartRodStackItem(
              0,
              -value3,
              isSecondChart
                  ? (touchedIndex > -1) && (x >= ((touchedIndex + 1) * 4)) || (x < ((touchedIndex) * 4))
                  ? Color(0xFFDFDFDF)
                  : Color(0xFFFFAA7A)
                  : (touchedIndex > -1 && touchedIndex != x)
                  ? Color(0xFFDFDFDF)
                  : Color(0xFFFFAA7A),
              const BorderSide(
                width: 0.5,
                color: AppColors.white,
              ),
            ),
            BarChartRodStackItem(
              0,
              value1,
              isSecondChart
                  ? (touchedIndex > -1) && (x >= ((touchedIndex + 1) * 4)) || (x < ((touchedIndex) * 4))
                  ? Color(0xFFDFDFDF)
                  : Color(0xFF5BA2EB)
                  : (touchedIndex > -1 && touchedIndex != x)
                  ? Color(0xFFDFDFDF)
                  : Color(0xFF5BA2EB),
              const BorderSide(
                width: 0.5,
                color: AppColors.white,
              ),
            ),
            BarChartRodStackItem(
              value1,
              value1 + value2,
              isSecondChart
                  ? (touchedIndex > -1) && (x >= ((touchedIndex + 1) * 4)) || (x < ((touchedIndex) * 4))
                  ? Color(0xFFDFDFDF)
                  : Color(0xFF34D491)
                  : (touchedIndex > -1 && touchedIndex != x)
                  ? Color(0xFFDFDFDF)
                  : Color(0xFF34D491),
              const BorderSide(
                width: 0.5,
                color: AppColors.white,
              ),
            ),
            BarChartRodStackItem(
              value1 + value2,
              value1 + value2 + value4,
              isSecondChart
                  ? (touchedIndex > -1) && (x >= ((touchedIndex + 1) * 4)) || (x < ((touchedIndex) * 4))
                  ? Color(0xFFDFDFDF)
                  : Color(0xFFFFAA7A)
                  : (touchedIndex > -1 && touchedIndex != x)
                  ? Color(0xFFDFDFDF)
                  : Color(0xFFFFAA7A),
              const BorderSide(
                width: 0.5,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool isShadowBar(int rodIndex) => rodIndex == 1;

  @override
  Widget build(BuildContext context) {
    // 建立圖表資料
    initData();

    return LayoutBuilder(
      builder: (context, constraints) {
        barsSpace =
            (constraints.maxWidth - (barDataList.length * barsWidth)) /
                (barDataList.length);
        return Container(
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 8.0, 4.0),
            height: widget.height,
            child: Column(
              children: [
                Expanded(child: Container(
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      maxY: maxYValue,
                      minY: -maxYValue,
                      groupsSpace: barsSpace,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: AppColors.milkOrange,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return null;
                          },
                        ),
                        handleBuiltInTouches: false,
                        touchCallback:
                            (FlTouchEvent event, barTouchResponse) {
                          if (event is FlTapDownEvent) {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              setState(() {
                                onItemTap!(false, [], [], []);
                                touchedIndex = -1;
                              });
                              return;
                            }
                            setState(() {
                              touchedIndex =
                                  barTouchResponse.spot!.touchedBarGroupIndex;
                              onItemTap!(true, barValueList[touchedIndex],
                                  [timeList[touchedIndex]],titleList);
                            });
                          }
                          print("touchedIndex：${touchedIndex}");
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 32,
                            getTitlesWidget: bottomTitles,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            interval: maxYValue/3,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: false,
                        horizontalInterval: maxYValue / 3,
                        verticalInterval: 1 / 6,
                        getDrawingHorizontalLine: (value) {
                          double roundedMinY = -(maxYValue / 3).round() / 10; // 四捨五入到小數第十位
                          double roundedMaxY = (maxYValue / 3).round() / 10; // 四捨五入到小數第十位
                          return FlLine(
                            color: (double.parse(value.toStringAsFixed(10)) >= roundedMinY && double.parse(value.toStringAsFixed(10)) <= roundedMaxY)?AppColors.grey:AppColors.borderGrey,
                            strokeWidth: 1,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return const FlLine(
                            color: AppColors.borderGrey,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: AppColors.borderGrey,
                        ),
                      ),
                      barGroups: barDataList,
                    ),
                  ),
                ),),
                Container(
                  height: widget.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Indicator(
                        color: Color(0xFF5BA2EB),
                        text: '市電',
                        isSquare: false,
                        width: 12.w,
                        height: 4.h,
                        textColor: AppColors.primaryBlack,
                      ),
                      Indicator(
                        color: Color(0xFF34D491),
                        text: '綠電',
                        isSquare: false,
                        width: 12.w,
                        height: 4.h,
                        textColor: AppColors.primaryBlack,
                      ),
                      Indicator(
                        color: Color(0xFFFFAA7A),
                        text: '儲能櫃',
                        isSquare: false,
                        width: 12.w,
                        height: 4.h,
                        textColor: AppColors.primaryBlack,
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  void initData() {
    // 建立長條圖資料
    barDataList.clear();
    barValueList.clear();
    timeList.clear();
    titleList.clear();
    maxYValue = 0.0001;
    for (int index = 0;
    index < energyDataList.energyList.length;
    index++) {
      titleList.clear();
      List<double> values = [];
      for (int i = 0;i < energyDataList.energyList[index].valueList.length;i++) {
        values.add(energyDataList.energyList[index].valueList[i] ?? 0);
        titleList.add(energyDataList.energyList[index].titleList[i] ?? "");
      }
      double sum = values[0] + values[1] + values[3]; // 第一、二、四項相加
      double thirdElement = values[2]; // 第三項

      if (sum > thirdElement) {
        if (maxYValue < sum) {
          maxYValue = sum;
        }
      } else {
        if (maxYValue < thirdElement) {
          maxYValue = thirdElement;
        }
      }
      String time = energyDataList.energyList[index].time.toString();
      barDataList.add(generateGroup(index, values[0], values[1], values[2], values[3]));
      barValueList.add(values);
      timeList.add(time);
    }
    maxYValue = maxYValue * 1.2;
  }
}
String extractHour(String dateTimeString) {
  try {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return dateTime.hour.toString().padLeft(2, '0');
  } catch (e) {
    print('Error parsing dateTimeString: $e');
    return '';
  }
}