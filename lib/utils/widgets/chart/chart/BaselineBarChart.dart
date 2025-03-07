import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/utils/widgets/Indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../resources/app_resources.dart';

class BaselineBarChart extends StatefulWidget {
  const BaselineBarChart({
    super.key,
    required this.onItemTap,
    required this.isChartClicked,
    required this.baselineVal,
    required this.energyDataList,
  });

  final Function(bool, List<double>, List<String>, List<String>) onItemTap;
  final bool isChartClicked;
  final String? baselineVal;
  final EnergyListData energyDataList;

  @override
  State<StatefulWidget> createState() => BaselineBarChartState();
}

class BaselineBarChartState extends State<BaselineBarChart> {
  late double fieldWidth;
  double barsWidth = 4.0; // 長條圖長條寬度
  late double barsSpace; // 長條圖長條間距
  double maxYValue = 20.0; // 圖表Y軸最大值
  double bottomTitleHeight = 28.sp; // X軸座標文字高度
  int touchedIndex = -1;
  int toolTipValue = 0;
  late Function(bool, List<double>, List<String>, List<String>) onItemTap;

  List<int> showingTooltipOnSpots = [];

  // 長條圖資料
  List<BarChartGroupData> barDataList = [];

  // 基線圖資料
  List<FlSpot> baseLineDataList = [];

  // 需被標記的資料資料
  List<int> pointList = [];

  // 長條圖值列表（用於點擊後回傳值）
  List<double> barValueList = [];
  // 基線圖值列表（用於點擊後回傳值）
  List<double> baseLineValueList = [];
  // 時間列表（用於點擊後回傳值）
  List<String> timeList = [];

  @override
  void initState() {
    super.initState();
    onItemTap = widget.onItemTap;
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    String text = '';
    // 顯示X軸提示條件：value加一後除以5的餘數是否為0，並且同時檢查value是否等於第一筆或最後一筆
    if ((value + 1) % 5 == 0 || value == barDataList.length - 1 || value == 0) {
      text = addLeadingZero((value + 1.0).toInt().toString());
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: getText(text, fontSize: 10.sp, color: AppColors.primaryBlack),
    );
  }
  @override
  void didUpdateWidget(covariant BaselineBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 當 isChartClicked 變為 false 時，取消圖表的點擊效果
    if (!widget.isChartClicked) {
      setState(() {
        touchedIndex = -1;
        showingTooltipOnSpots.clear();
      });
    }
  }

  void handleChartTap(int index) {
    setState(() {
      touchedIndex = index;
      double tempToolTipValue = touchedIndex >= 0
          ? (barValueList[touchedIndex] - baseLineValueList[touchedIndex]) /
          baseLineValueList[touchedIndex] *
          100
          : 0;

      if (tempToolTipValue > 0) {
        showingTooltipOnSpots = [touchedIndex];
        toolTipValue = tempToolTipValue.toInt();
      } else {
        showingTooltipOnSpots.clear();
      }

      onItemTap(
        true,
        [
          baseLineValueList[touchedIndex],
          barValueList[touchedIndex]
        ],
        [timeList[touchedIndex]], // 原本的時間資訊
        timeList, // 加入完整的時間列表
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 建立圖表資料
    initData();

    final lineBarsData = [
      LineChartBarData(
          showingIndicators: showingTooltipOnSpots,
          spots: baseLineDataList,
          isCurved: false,
          barWidth: 1,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              if (pointList.contains(index)) {
                return FlDotCirclePainter(
                  radius: 2,
                  color: AppColors.orange,
                  strokeWidth: 1,
                  strokeColor: AppColors.milkOrange,
                );
              } else {
                return FlDotCirclePainter(
                  radius: 0,
                  color: AppColors.transparent,
                  strokeWidth: 0,
                  strokeColor: AppColors.transparent,
                );
              }
            },
            checkToShowDot: (spot, barData) {
              return spot.x != 0 && spot.x != 6;
            },
          ),
          color: AppColors.orange),
    ];

    return AspectRatio(
      aspectRatio: 2.7,
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              barsSpace =
                  (constraints.maxWidth - (barDataList.length * barsWidth)) /
                      (barDataList.length);

              return Container(
                height: constraints.maxWidth / 2.7,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: constraints.maxWidth / 2.7 * 0.8,
                            child: BarChart(
                              BarChartData(
                                maxY: maxYValue,
                                alignment: BarChartAlignment.start,
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                        return null;
                                      }),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: bottomTitleHeight,
                                      getTitlesWidget: bottomTitles,
                                    ),
                                  ),
                                  leftTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: maxYValue / 6,
                                  verticalInterval: 1 / 6,
                                  // checkToShowHorizontalLine: (value) => value % 16 == 0,
                                  // checkToShowVerticalLine: (value) => value % 0.1 == 0,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: AppColors.borderGrey,
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
                                groupsSpace: barsSpace,
                                barGroups: barDataList,
                              ),
                            )),
                        Container(
                          height: constraints.maxWidth / 2.7 * 0.8,
                          padding: EdgeInsets.fromLTRB(barsWidth / 2, 0,
                              barsSpace + barsWidth / 2, bottomTitleHeight),
                          child: LineChart(
                            LineChartData(
                              showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                                return ShowingTooltipIndicators([
                                  LineBarSpot(
                                    lineBarsData[0],
                                    lineBarsData.indexOf(lineBarsData[0]),
                                    lineBarsData[0].spots[index],
                                  ),
                                ]);
                              }).toList(),
                              lineTouchData: LineTouchData(
                                enabled: true,
                                handleBuiltInTouches: false,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor: AppColors.milkOrange,
                                  getTooltipItems:
                                      (List<LineBarSpot> touchedBarSpots) {
                                    return touchedBarSpots.map((barSpot) {
                                      return LineTooltipItem(
                                        '+ ${toolTipValue.toString()} %',
                                        TextStyle(
                                          color: AppColors.orange,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      );
                                    }).toList();
                                  },
                                ),
                                getTouchedSpotIndicator:
                                    (LineChartBarData barData,
                                    List<int> spotIndexes) {
                                  return spotIndexes.map((spotIndex) {
                                    return TouchedSpotIndicatorData(
                                      FlLine(
                                        color: Colors.transparent,
                                        strokeWidth: 0,
                                      ),
                                      FlDotData(
                                        getDotPainter:
                                            (spot, percent, barData, index) {
                                          return FlDotCirclePainter(
                                            radius: 0,
                                            color: AppColors.transparent,
                                            strokeWidth: 0,
                                            strokeColor:
                                            AppColors.transparent,
                                          );
                                        },
                                      ),
                                    );
                                  }).toList();
                                },
                                touchCallback:
                                    (FlTouchEvent event, barTouchResponse) {
                                  if (event is FlTapDownEvent) {
                                    if (!event.isInterestedForInteractions ||
                                        barTouchResponse == null ||
                                        barTouchResponse.lineBarSpots ==
                                            null) {
                                      setState(() {
                                        onItemTap!(false, [], [], []);
                                        touchedIndex = -1;
                                        showingTooltipOnSpots.clear();
                                      });
                                      return;
                                    }
                                    setState(() {
                                      touchedIndex = barTouchResponse
                                          .lineBarSpots!.first.spotIndex;

                                      double tempToolTipValue =
                                      touchedIndex >= 0
                                          ? (barValueList[touchedIndex] - baseLineValueList[touchedIndex]) /
                                          baseLineValueList[touchedIndex] * 100
                                          : 0;
                                      if(tempToolTipValue>0){
                                        showingTooltipOnSpots = [touchedIndex];
                                        toolTipValue = tempToolTipValue.toInt();
                                      }else{
                                        showingTooltipOnSpots.clear();
                                      }

                                      onItemTap!(true, [
                                        baseLineValueList[touchedIndex],
                                        barValueList[touchedIndex]
                                      ], [timeList[touchedIndex]], [timeList[touchedIndex]]);
                                    });
                                  }
                                  print("touchedIndex：${touchedIndex}");
                                },
                              ),
                              lineBarsData: lineBarsData,
                              maxY: maxYValue,
                              minY: 0,
                              titlesData: const FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(
                                show: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: constraints.maxWidth / 2.7 * 0.2,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       if (widget.energyDataList.energyList.isNotEmpty)
                    //         for (String text in widget
                    //             .energyDataList.energyList[0].titleList)
                    //           Indicator(
                    //             color: Color(0xFFFFB02F),
                    //             text: text,
                    //             isSquare: false,
                    //             width: 12.w,
                    //             height: 4.h,
                    //             textColor: AppColors.primaryBlack,
                    //           ),
                    //       Indicator(
                    //         color: Color(0xFFF56716),
                    //         text: '基線值',
                    //         isSquare: false,
                    //         width: 12.w,
                    //         height: 4.h,
                    //         textColor: AppColors.primaryBlack,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void initData() {
    barDataList.clear();
    baseLineDataList.clear();
    pointList.clear();
    barValueList.clear();
    baseLineValueList.clear();
    timeList.clear();
    maxYValue = 20.0;

    for (int index = 0; index < widget.energyDataList.energyList.length; index++) {
      double value = widget.energyDataList.energyList[index].valueList[0] ?? 0;
      String time = widget.energyDataList.energyList[index].time.toString();
      value = value < 0 ? 0 : value;

      barDataList.add(generateGroup(index, value));
      barValueList.add(value);
      timeList.add(time);

      if (maxYValue < value) {
        maxYValue = value;
      }
    }

    // 建立基線圖資料
    if (widget.baselineVal != "" && widget.baselineVal != null) {
      for (int index = 0; index < widget.energyDataList.energyList.length; index++) {
        double baseValue = double.parse(widget.baselineVal!);
        double value = widget.energyDataList.energyList[index].valueList[0] ?? 0;

        baseLineDataList.add(FlSpot(index.toDouble(), baseValue));
        baseLineValueList.add(baseValue);
        if (value > baseValue) {
          pointList.add(index);
        }
        if (maxYValue < baseValue) {
          maxYValue = baseValue;
        }
      }
    }
    maxYValue = maxYValue * 1.2;
  }

  BarChartGroupData generateGroup(int x, double value1) {
    final isTop = value1 > 0;
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: value1,
          width: barsWidth,
          borderRadius: isTop
              ? const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6))
              : const BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1,
              isTouched ? Colors.orange : Color(0xFFFFB02F),
              const BorderSide(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
bool shouldDisplayText(int length, int value) {
  if (length <= 13) {
    return true; // 小於 12，正常顯示
  } else if (length < 27) {
    return value % 4 == 0; // 小於 27，4 的倍數顯示
  } else if (length <= 32) {
    return value % 5 == 0; // 小於等於 31，5 的倍數顯示
  }
  return false; // 其他情況不顯示
}