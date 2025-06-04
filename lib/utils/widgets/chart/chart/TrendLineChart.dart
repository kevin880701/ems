import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/utils/widgets/Indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendLineChart extends StatefulWidget {
  const TrendLineChart(
      {super.key,
      required this.onItemTap,
      required this.isChartClicked,
      required this.baselineVal,
      required this.energyDataList});

  final Function(bool, List<double>, List<String>, List<String>) onItemTap;
  final bool isChartClicked;
  final String? baselineVal;
  final EnergyListData energyDataList;

  @override
  State<TrendLineChart> createState() => _TrendLineChartState();
}

class _TrendLineChartState extends State<TrendLineChart> {
  List<Color> gradientColors = [
    Color(0xFF9EBCE8),
    AppColors.white,
  ];

  List<Color> grayGradientColors = [
    Color(0xFFE3E3E3),
    AppColors.white,
  ];

  // List<FlSpot> data = [
  //   FlSpot(1, 2),
  //   FlSpot(2, 5),
  //   FlSpot(3, 3),
  //   FlSpot(4, 4),
  //   FlSpot(5, 3),
  //   FlSpot(6, 4),
  //   FlSpot(7, 4),
  //   FlSpot(8, 4),
  //   FlSpot(9, 9),
  //   FlSpot(10, 8),
  //   FlSpot(11, 10),
  //   FlSpot(12, 11),
  // ];

  // List<FlSpot> baselineData = [
  //   FlSpot(1, 4),
  //   FlSpot(2, 6),
  //   FlSpot(3, 5),
  //   FlSpot(4, 9),
  //   FlSpot(5, 15),
  //   FlSpot(6, 10),
  //   FlSpot(7, 9),
  //   FlSpot(8, 7),
  //   FlSpot(9, 12),
  //   FlSpot(10, 10),
  //   FlSpot(11, 17),
  //   FlSpot(12, 12),
  // ];

  bool showAvg = false;
  int touchedIndex = -1;
  double maxYValue = 20.0; // 圖表Y軸最大值
  int maxXValue = 12; // 圖表X軸最大值

  Function(bool, List<double>, List<String>, List<String>)? onItemTap =
      (bool isTapped, List<double>? data, List<String> times, List<String> title) {};

  // 基線圖資料
  List<FlSpot> baseLineDataList = [];

  // 趨勢圖資料
  List<FlSpot> trendDataList = [];

  // 趨勢圖值列表（用於點擊後回傳值）
  List<double> trendValueList = [];

  // 基線圖值列表（用於點擊後回傳值）
  List<double> baseLineValueList = [];

  // 時間列表（用於點擊後回傳值）
  List<String> timeList = [];

  int rangeStart = 0;
  late int rangeEnd = 0;

  @override
  void initState() {
    super.initState();
    onItemTap = widget.onItemTap;

    // 建立圖表資料
    initData();
  }

  @override
  void didUpdateWidget(covariant TrendLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 當 isChartClicked 變為 false 時，也就是圖表外部被點擊時，將 touchedIndex 設定為 -1取消圖表的點擊效果
    if (!widget.isChartClicked!) {
      setState(() {
        touchedIndex = -1;

        rangeStart = 0;
        rangeEnd = trendDataList.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 建立圖表資料
    setState(() {
      initData();
    });

    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
        // Container(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       if (widget.energyDataList.energyList.isNotEmpty)
        //         for (String text
        //             in widget.energyDataList.energyList[0].titleList)
        //           Indicator(
        //             color: AppColors.appPrimaryBlue,
        //             text: text,
        //             isSquare: false,
        //             width: 12,
        //             height: 4,
        //             textColor: AppColors.primaryBlack,
        //           ),
        //       Indicator(
        //         color: Color(0xFFE83A3A),
        //         text: ' 期望線 ',
        //         isSquare: false,
        //         width: 12,
        //         height: 4,
        //         textColor: AppColors.primaryBlack,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text = '';
    // 顯示X軸提示條件：value加一後除以5的餘數是否為0，並且同時檢查value是否等於第一筆或最後一筆
    if ((value + 1) % 5 == 0 ||
        value == trendDataList.length - 1 ||
        value == 0) {
      text = addLeadingZero((value + 1.0).toInt().toString());
    }

    return SideTitleWidget(
      meta: meta,
      child: getText(text, fontSize: 10.sp, color: AppColors.primaryBlack),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        horizontalInterval: maxYValue / 6,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
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
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.borderGrey),
      ),
      // minX: 1,
      // maxX: 12,
      minY: 0,
      maxY: maxYValue,
      lineTouchData: LineTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          if (response == null || response.lineBarSpots == null) {
            return;
          }
          if (event is FlTapDownEvent) {
            print("###：FlTapDownEvent");
            if (!event.isInterestedForInteractions ||
                response == null ||
                response.lineBarSpots == null) {
              setState(() {
                onItemTap!(false, [], [], []);
                touchedIndex = -1;

                rangeStart = trendDataList.length - 1;
                rangeEnd = 0;
              });
              return;
            }

            setState(() {
              touchedIndex = response.lineBarSpots!.first.spotIndex;
              getSpotsAroundTouchedIndex(trendDataList, touchedIndex);
              onItemTap!(true, trendValueList.sublist(rangeStart, rangeEnd + 1),
                  timeList.sublist(rangeStart, rangeEnd + 1),
                  timeList.sublist(rangeStart, rangeEnd + 1));
            });
          }
        },
      ),
      lineBarsData: [
        LineChartBarData(
          spots: trendDataList,
          isCurved: false,
          color: AppColors.appPrimaryBlue,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors.map((color) => color).toList(),
            ),
            spotsLine: BarAreaSpotsLine(
              show: false,
            ),
          ),
        ),
        LineChartBarData(
          spots: trendDataList.sublist(0, rangeStart),
          isCurved: false,
          color: AppColors.borderGrey,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: grayGradientColors.map((color) => color).toList(),
            ),
            spotsLine: BarAreaSpotsLine(
              show: false,
              flLineStyle: FlLine(
                color: AppColors.red,
                strokeWidth: 2,
              ),
              checkToShowSpotLine: (spot) {
                if (spot.x == 0 || spot.x == 6) {
                  return false;
                }
                return true;
              },
            ),
          ),
        ),
        LineChartBarData(
          spots: trendDataList.sublist(rangeEnd, trendDataList.length),
          isCurved: false,
          color: AppColors.borderGrey,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
            checkToShowDot: (spot, barData) {
              return spot.x != 0 && spot.x != 6;
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: grayGradientColors.map((color) => color).toList(),
            ),
            spotsLine: BarAreaSpotsLine(
              show: false,
            ),
          ),
        ),
        LineChartBarData(
          spots: [trendDataList[trendDataList.length - 1]],
          isCurved: false,
          color: AppColors.borderGrey,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
                color: AppColors.appPrimaryBlue,
                strokeWidth: 3,
                strokeColor: AppColors.milkBlue,
              );
            },
            checkToShowDot: (spot, barData) {
              return spot.x != 0 && spot.x != 6;
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: grayGradientColors.map((color) => color).toList(),
            ),
            spotsLine: BarAreaSpotsLine(
              show: false,
            ),
          ),
        ),
        LineChartBarData(
          spots: baseLineDataList,
          isCurved: false,
          color: AppColors.red,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }

  List<FlSpot> getSpotsAroundTouchedIndex(List<FlSpot> data, int touchedIndex) {
    // 確保數據不為空
    if (data.isEmpty) {
      return [];
    }

    // 定義要返回的數據列表
    List<FlSpot> spotsAroundTouchedIndex = [];

    // 根據 touchedIndex 的值設定範圍的起始和結束索引
    if (touchedIndex == 0) {
      rangeStart = 0;
      rangeEnd = 2; // 如果 touchedIndex 為 0，則範圍為第 0、1、2 個數據
    } else if (touchedIndex == data.length - 1) {
      rangeStart = data.length - 3; // 如果 touchedIndex 為最後一個索引，則範圍從倒數第 3 個數據開始
      rangeEnd = data.length - 1;
    } else {
      rangeStart = touchedIndex - 1;
      rangeEnd = touchedIndex + 1;
    }
    // 提取數據並添加到結果列表中
    for (int i = rangeStart; i <= rangeEnd; i++) {
      spotsAroundTouchedIndex.add(data[i]);
    }
    return spotsAroundTouchedIndex;
  }

  void initData() {
    print("initData");
    // 建立圖表資料
    trendDataList.clear();
    baseLineDataList.clear();
    trendValueList.clear();
    baseLineValueList.clear();
    timeList.clear();
    maxYValue = 20.0;
    for (int index = 0;
        index < widget.energyDataList.energyList.length;
        index++) {
      double value =
          widget.energyDataList.energyList[index].valueList[0] == null
              ? 0
              : widget.energyDataList.energyList[index].valueList[0]!;
      String time = widget.energyDataList.energyList[index].time.toString();
      // value不該小於0
      value = value < 0 ? 0 : value;
      trendDataList.add(FlSpot(index.toDouble(), value.toDouble()));
      trendValueList.add(value);
      timeList.add(time);
      if (maxYValue < value) {
        maxYValue = value;
      }
    }
    // 建立基線圖資料，需先判斷是否有設定基線值
    if (widget.baselineVal != "" && widget.baselineVal != null) {
      for (int index = 0;
          index < widget.energyDataList.energyList.length;
          index++) {
        double baseValue = double.parse(widget.baselineVal!);
        double value =
            widget.energyDataList.energyList[index].valueList[0] == null
                ? 0
                : widget.energyDataList.energyList[index].valueList[0]!;

        baseLineDataList.add(FlSpot(index.toDouble(), baseValue));
        baseLineValueList.add(baseValue);

        if (maxYValue < double.parse(widget.baselineVal!)) {
          maxYValue = double.parse(widget.baselineVal!);
        }
      }
    }
    if (maxXValue != trendValueList.length) {
      rangeEnd = trendDataList.length - 1;
      maxXValue = trendValueList.length;
    }
    maxYValue = maxYValue * 1.2;
  }
}
