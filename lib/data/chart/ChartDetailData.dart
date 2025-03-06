import 'ChartInfo.dart';

class ChartDetailData {
  final List<String> times;
  final List<double> values;
  final ChartInfo chartInfo;
  final String timeFormat;

  ChartDetailData({
    required this.times,
    required this.values,
    required this.chartInfo,
    required this.timeFormat,
  });
}
