import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'SymmetricBarChart.dart';

class SlideSymmetricBarChart extends StatefulWidget {
  const SlideSymmetricBarChart({
    super.key,
    required this.onItemTap,
    required this.isChartClicked,
    required this.energyDataList,
    this.height = 400.0,
  });

  final Function(bool, List<double>, List<String>, List<String>) onItemTap;
  final bool isChartClicked;
  final EnergyListData energyDataList;
  final double height;

  @override
  _SlideSymmetricBarChartState createState() => _SlideSymmetricBarChartState();
}

class _SlideSymmetricBarChartState extends State<SlideSymmetricBarChart> {
  late List<EnergyListData> segmentedDataList;
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    segmentedDataList = _splitData(widget.energyDataList);
    _currentIndex = _calculateCurrentIndex();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// 分割資料為 3 個部分 (00:00-08:00, 08:00-16:00, 16:00-24:00)
  List<EnergyListData> _splitData(EnergyListData energyDataList) {
    List<EnergyListData> segments = [];
    List<EnergyData> data = energyDataList.energyList;

    // 分割資料為 3 段
    if (data.length == 24) {
      segments.add(EnergyListData(energyList: data.sublist(0, 8)));
      segments.add(EnergyListData(energyList: data.sublist(8, 16)));
      segments.add(EnergyListData(energyList: data.sublist(16, 24)));
    }
    return segments;
  }

  @override
  Widget build(BuildContext context) {
    bool isPageView = widget.energyDataList.energyList.length == 24;
    return Container(
      height: widget.height,
      child: isPageView
          ? Row(
              children: [
                GestureDetector(
                  onTap: _currentIndex > 0
                      ? () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  child: Container(
                    margin: EdgeInsets.only(bottom: widget.height * 0.4),
                    child: getImageIcon(
                      "arrow_left.png",
                      height: 16.sp,
                      width: 16.sp,
                      color: _currentIndex > 0
                          ? AppColors.primaryBlack
                          : AppColors.disableGrey,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: segmentedDataList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SymmetricBarChart(
                        onItemTap: widget.onItemTap,
                        isChartClicked: widget.isChartClicked,
                        energyDataList: segmentedDataList[index],
                        height: widget.height,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: _currentIndex < segmentedDataList.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  child: Container(
                    margin: EdgeInsets.only(bottom: widget.height * 0.4),
                    child: getImageIcon(
                      "arrow_right.png",
                      height: 16.sp,
                      width: 16.sp,
                      color: _currentIndex < segmentedDataList.length - 1
                          ? AppColors.primaryBlack
                          : AppColors.disableGrey,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: widget.height * 0.4),
                  child: getImageIcon(
                    "arrow_left.png",
                    height: 16.sp,
                    width: 16.sp,
                    color: AppColors.disableGrey,
                  ),
                ),
                Expanded(
                  child: SymmetricBarChart(
                    onItemTap: widget.onItemTap,
                    isChartClicked: widget.isChartClicked,
                    energyDataList: widget.energyDataList,
                    height: widget.height,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: widget.height * 0.4),
                  child: getImageIcon(
                    "arrow_right.png",
                    height: 16.sp,
                    width: 16.sp,
                    color: AppColors.disableGrey,
                  ),
                ),
              ],
            ),
    );
  }
}

int _calculateCurrentIndex() {
  final now = DateTime.now(); // 取得當前時間
  final hour = now.hour; // 取得小時

  if (hour >= 0 && hour < 8) {
    return 0; // 00:00 - 08:00
  } else if (hour >= 8 && hour < 16) {
    return 1; // 08:00 - 16:00
  } else {
    return 2; // 16:00 - 24:00
  }
}