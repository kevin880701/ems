import 'ChartInfo.dart';

class ChartConfig {
  final String pieChartType;
  final bool hasChart;
  final String? chartType;
  final bool? hasSecondChart;
  final bool? hasDetail;
  bool isAlwaysShowDetail = false;
  final ChartInfo chartInfo;

  ChartConfig({
    required this.pieChartType,
    required this.hasChart,
    required this.chartType,
    required this.hasSecondChart,
    required this.hasDetail,
    required this.isAlwaysShowDetail,
    required this.chartInfo});

  factory ChartConfig.fromWidgetType(String widgetType) {
    String pieChartType = "multiplePieChart";
    bool hasChart = false;
    String? chartType;
    bool? hasSecondChart = false;
    bool? hasDetail = false;
    bool? isAlwaysShowDetail = false;
    ChartInfo chartIconColor =  ChartInfo.getChartWidget(widgetType);
    print(widgetType);
    if (widgetType.contains('_area')) {
      pieChartType = "multiplePieChart";
      hasChart = true;
      chartType = "trendLineChart";
      hasSecondChart = false;
      hasDetail = true;
      isAlwaysShowDetail = false;
    } else if (widgetType.contains('bar_line')) {
      pieChartType = "baselinePieChart";
      hasChart = true;
      chartType = "baselineBarChart";
      hasSecondChart = false;
      hasDetail = true;
      isAlwaysShowDetail = false;
    } else if (widgetType.contains('_bar')) {
      pieChartType = "baselinePieChart";
      hasChart = true;
      chartType = "barChart";
      hasSecondChart = false;
      hasDetail = true;
      isAlwaysShowDetail = false;
    } else if (widgetType.contains('dashboard_')) {
      pieChartType = "baselinePieChart";
      hasChart = false;
      chartType = null;
      hasSecondChart = false;
      hasDetail = false;
      isAlwaysShowDetail = false;
    }

    // 目前強制顯示
    pieChartType = "baselinePieChart";
    hasChart = true;
    chartType = "symmetricBarChart";
    hasSecondChart = true;
    hasDetail = true;
    isAlwaysShowDetail = false;
    chartIconColor =  ChartInfo.getChartWidget("battery");

    return ChartConfig(
      pieChartType: pieChartType,
      hasChart: hasChart,
      chartType: chartType,
      hasSecondChart: hasSecondChart,
      hasDetail: hasDetail,
      isAlwaysShowDetail: isAlwaysShowDetail,
      chartInfo: chartIconColor,
    );
  }
}
