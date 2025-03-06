import 'dart:ui';
import 'package:ems_app/resources/app_resources.dart';
import '../../define.dart';

class ChartInfo {
  final String chinese;
  final String unit;
  final String iconPath;
  final List<Color> colors;

  ChartInfo({
    required this.chinese,
    required this.unit,
    required this.iconPath,
    required this.colors,
  });

  factory ChartInfo.getChartWidget(String widgetType) {
    if (widgetType.contains('power')) {
      return ChartInfo(
        chinese: "電",
        unit: AppTexts.wh,
        iconPath: 'energy.png',
        colors: [
          AppColors.chartYellow,
          colorOpacity(AppColors.chartYellow, 0.8),
          colorOpacity(AppColors.chartYellow, 0.6),
          colorOpacity(AppColors.chartYellow, 0.4),
          colorOpacity(AppColors.chartYellow, 0.2)
        ],
      );
    } else if (widgetType.contains('gas')) {
      return ChartInfo(
        chinese: "氣",
        unit: AppTexts.wh,
        iconPath: 'gas.png',
        colors: [
          AppColors.chartWaterBlue,
          colorOpacity(AppColors.chartWaterBlue, 0.8),
          colorOpacity(AppColors.chartWaterBlue, 0.6),
          colorOpacity(AppColors.chartWaterBlue, 0.4),
          colorOpacity(AppColors.chartWaterBlue, 0.2),
        ],
      );
    } else if (widgetType.contains('oil')) {
      return ChartInfo(
        chinese: "油",
        unit: AppTexts.kL,
        iconPath: 'oil.png',
        colors: [
          AppColors.chartPurple,
          colorOpacity(AppColors.chartPurple, 0.8),
          colorOpacity(AppColors.chartPurple, 0.6),
          colorOpacity(AppColors.chartPurple, 0.4),
          colorOpacity(AppColors.chartPurple, 0.2),
        ],
      );
    } else if (widgetType.contains('water')) {
      return ChartInfo(
        chinese: "水",
        unit: AppTexts.l,
        iconPath: 'water.png',
        colors: [
          AppColors.chartBlue,
          colorOpacity(AppColors.chartBlue, 0.8),
          colorOpacity(AppColors.chartBlue, 0.6),
          colorOpacity(AppColors.chartBlue, 0.4),
          colorOpacity(AppColors.chartBlue, 0.2),
        ],
      );
    } else if (widgetType.contains('battery')) {
      return ChartInfo(
        chinese: "電",
        unit: AppTexts.wh,
        iconPath: 'battery.png',
        colors: [
          AppColors.essGreen,
          colorOpacity(AppColors.essGreen, 0.8),
          colorOpacity(AppColors.essGreen, 0.6),
          colorOpacity(AppColors.essGreen, 0.4),
          colorOpacity(AppColors.essGreen, 0.2),
        ],
      );
    } else if (widgetType.contains('PM25_PM10')) {
      return ChartInfo(
        chinese: "氣",
        unit: AppTexts.ugm3,
        iconPath: 'co2.png',
        colors: [
          AppColors.chartDarkPurple,
          colorOpacity(AppColors.chartDarkPurple, 0.8),
          colorOpacity(AppColors.chartDarkPurple, 0.6),
          colorOpacity(AppColors.chartDarkPurple, 0.4),
          colorOpacity(AppColors.chartDarkPurple, 0.2),
        ],
      );
    } else if (widgetType.contains('env')) {
      return ChartInfo(
        chinese: "氣",
        unit: AppTexts.ugm3,
        iconPath: 'co2.png',
        colors: [
          AppColors.chartDarkPurple,
          colorOpacity(AppColors.chartDarkPurple, 0.8),
          colorOpacity(AppColors.chartDarkPurple, 0.6),
          colorOpacity(AppColors.chartDarkPurple, 0.4),
          colorOpacity(AppColors.chartDarkPurple, 0.2),
        ],
      );
    } else if (widgetType.contains('TVOC')) {
      return ChartInfo(
        chinese: "氣",
        unit: AppTexts.ppb,
        iconPath: 'tvoc.png',
        colors: [
          AppColors.chartDarkPurple,
          colorOpacity(AppColors.chartDarkPurple, 0.8),
          colorOpacity(AppColors.chartDarkPurple, 0.6),
          colorOpacity(AppColors.chartDarkPurple, 0.4),
          colorOpacity(AppColors.chartDarkPurple, 0.2),
        ],
      );
    } else if (widgetType.contains('HCHO')) {
      return ChartInfo(
        chinese: "氣",
        unit: AppTexts.ppb,
        iconPath: 'hcho.png',
        colors: [
          AppColors.chartDarkPurple,
          colorOpacity(AppColors.chartDarkPurple, 0.8),
          colorOpacity(AppColors.chartDarkPurple, 0.6),
          colorOpacity(AppColors.chartDarkPurple, 0.4),
          colorOpacity(AppColors.chartDarkPurple, 0.2),
        ],
      );
    } else {
      return ChartInfo(
        chinese: "電",
        unit: AppTexts.wh,
        iconPath: 'energy.png',
        colors: [
          AppColors.chartYellow,
          colorOpacity(AppColors.chartYellow, 0.8),
          colorOpacity(AppColors.chartYellow, 0.6),
          colorOpacity(AppColors.chartYellow, 0.4),
          colorOpacity(AppColors.chartYellow, 0.2)
        ],
      );
    }
  }
}
