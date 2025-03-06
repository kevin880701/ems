import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../widgets/datePicker/library/date_picker.dart';
import '../../widgets/datePicker/library/date_picker_manager.dart';
import '../widget/DialogTitleBar.dart';

class PickerDateDialog extends StatefulWidget {
  const PickerDateDialog({
    super.key,
    required this.chooseDay,
    required this.chooseMonth,
    required this.chooseYear,
    required this.chooseDate,
    required this.dateSwitcherIndex,
  });

  final DateTime? chooseDay;
  final String? chooseMonth;
  final String? chooseYear;
  final int dateSwitcherIndex;
  final Function(DateTime?, String?, String?, int) chooseDate;

  @override
  _PickerDateDialog createState() => _PickerDateDialog();
}

class _PickerDateDialog extends State<PickerDateDialog> {
  bool isAllowSearch = true;
  late double screenWidth;
  final List<String> dateOptions = ["日", "月", "年"];
  List<String> monthList = [
    '1月',
    '2月',
    '3月',
    '4月',
    '5月',
    '6月',
    '7月',
    '8月',
    '9月',
    '10月',
    '11月',
    '12月'
  ];
  Map<String, int> monthMap = {
    '1月': 1,
    '2月': 2,
    '3月': 3,
    '4月': 4,
    '5月': 5,
    '6月': 6,
    '7月': 7,
    '8月': 8,
    '9月': 9,
    '10月': 10,
    '11月': 11,
    '12月': 12,
  };

  List<String> yearList = [];
  int dateSwitcherIndex = 0;
  int daySelectorIndex = -1;
  int monthSelectorIndex = -1;
  int yearSelectorIndex = -1;
  int currentYearSelectorIndex = 0;

  DateTime? chooseDay = DateTime.now();
  final DateRangePickerController _controller = DateRangePickerController();
  late String? chooseMonth;
  late String? chooseYear;

  // 當前的日期時間
  DateTime now = DateTime.now();
  late String currentMonth;
  late String currentYear;

  // 選擇月份用
  int viewMonthSelectorYear = -1;
  int tempMonthSelectorYear = -1;
  int tempMonthSelectorMonth = -1;

  @override
  void initState() {
    // 獲取當前的年份和月份
    currentYear = now.year.toString();
    currentMonth = addLeadingZero(now.month.toString());

    chooseDay = widget.chooseDay;
    chooseMonth = widget.chooseMonth;
    chooseYear = widget.chooseYear;
    dateSwitcherIndex = widget.dateSwitcherIndex;

    if (chooseMonth != null) {
      monthSelectorIndex = int.parse(chooseMonth!.split('-')[1]) - 1;

      viewMonthSelectorYear = int.parse(chooseMonth!.split('-')[0]);
      tempMonthSelectorYear = int.parse(chooseMonth!.split('-')[0]);
      tempMonthSelectorMonth = int.parse(chooseMonth!.split('-')[1]);
    } else {
      viewMonthSelectorYear = int.parse(currentYear);
      tempMonthSelectorYear = int.parse(currentYear);
      tempMonthSelectorMonth = int.parse(currentMonth);
    }

    _controller.selectedDate = chooseDay;

    // 創建yearList（已當前年分往前抓10年）
    for (int i = int.parse(currentYear) - 10;
        i <= int.parse(currentYear);
        i++) {
      yearList.add(i.toString());
    }

    // 獲取已選擇年在yearList中的index
    yearSelectorIndex = yearList.indexOf(chooseYear.toString());
    // 獲取今年在yearList中的index，用於持續顯示底色
    currentYearSelectorIndex = yearList.indexOf(currentYear.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: AppColors.white,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: DialogTitleBar(
                  title: AppTexts.changeTime,
                  rightWidget: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: getImage(
                      "dialog_cancel.png",
                      height: 32.sp,
                      width: 32.sp,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24.sp, 0.sp, 24.sp, 24.sp),
                child:
              IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.sp,
                    ),
                    dateSwitcherWidget(),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Expanded(
                      child: Container(
                        child: dateSwitcherIndex == 0
                            ? daySelectorWidget()
                            : dateSwitcherIndex == 1
                            ? monthSelectorWidget() // 當 dateSwitcherIndex 為 1 時顯示的內容
                            : dateSwitcherIndex == 2
                            ? yearSelectorWidget() // 當 dateSwitcherIndex 為 2 時顯示的內容
                            : SizedBox(), // 其他情況下不顯示任何內容
                      ),
                    ),
                  ],
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget dateSwitcherWidget() {
    return Container(
        child: Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: AppColors.borderLightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          for (var i = 0; i < dateOptions.length; i++)
            Expanded(child: dateSwitcherItemWidget(dateOptions[i], i)),
        ],
      ),
    ));
  }

  Widget dateSwitcherItemWidget(String text, int index) {
    bool isSelected = dateSwitcherIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          dateSwitcherIndex = index;
          print(dateSwitcherIndex);
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: getText(
          text,
          fontSize: 14.sp,
          color: isSelected ? AppColors.primaryBlack : AppColors.grey,
        ),
      ),
    );
  }

  Widget daySelectorWidget() {
    if(chooseDay != null){
      _controller.displayDate = chooseDay;
    }
    return Container(
      height: 300.sp,
      child: Column(
        children: [
          Expanded(
              child: SfDateRangePicker(
            showNavigationArrow: false,
            showTodayButton: true,
            todayHighlightColor: AppColors.appPrimaryBlue,
            controller: _controller,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            selectionColor: AppColors.appPrimaryBlue,
            monthFormat: 'MM',
            onSelectionChanged: (details) {
              setState(() {
                widget.chooseDate(details.value, null, null, dateSwitcherIndex);
                Navigator.of(context).pop();
              });
            },
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(color: AppColors.appPrimaryBlack, fontSize: 12.sp, fontFamily: Platform.isIOS ? "PingFangTC" : "NotoSansTC",
                  fontWeight: FontWeight.w400),
                disabledDatesTextStyle: TextStyle(color: AppColors.disableGrey, fontSize: 12.sp, fontFamily: Platform.isIOS ? "PingFangTC" : "NotoSansTC",
                    fontWeight: FontWeight.w400),
              todayTextStyle:
                  TextStyle(color: AppColors.appPrimaryBlue, fontSize: 12.sp, fontFamily: Platform.isIOS ? "PingFangTC" : "NotoSansTC",
                      fontWeight: FontWeight.w400),
              todayCellDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.milkBlue,
                  shape: BoxShape.rectangle),
              leadingDatesTextStyle:  TextStyle(color: AppColors.grey, fontSize: 12.sp, fontFamily: Platform.isIOS ?
              "PingFangTC"
                  : "NotoSansTC",
                  fontWeight: FontWeight.w400),
              trailingDatesTextStyle: TextStyle(color: AppColors.grey, fontSize: 12.sp, fontFamily: Platform.isIOS ?
              "PingFangTC"
                  : "NotoSansTC",
                  fontWeight: FontWeight.w400),
            ),
            monthViewSettings: const DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: true, enableSwipeSelection: false),
          ))
        ],
      ),
    );
  }

  Widget monthSelectorWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (viewMonthSelectorYear > int.parse(currentYear) - 10) {
                    viewMonthSelectorYear = viewMonthSelectorYear - 1;
                  }
                });
              },
              child: getImageIcon("arrow_left.png",
                  height: 28.sp,
                  width: 28.sp,
                  color: viewMonthSelectorYear == int.parse(currentYear) - 10
                      ? AppColors.grey
                      : AppColors.appPrimaryBlue),
            ),
            SizedBox(
              width: 4.sp,
            ),
            getText(
              "$viewMonthSelectorYear-${addLeadingZero(tempMonthSelectorMonth.toString())}",
              fontSize: 20.sp,
              color: AppColors.primaryBlack,
            ),
            SizedBox(
              width: 4.sp,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (viewMonthSelectorYear < int.parse(currentYear)) {
                    viewMonthSelectorYear = viewMonthSelectorYear + 1;
                  }
                });
              },
              child: getImageIcon("arrow_right.png",
                  height: 28.sp,
                  width: 28.sp,
                  color: viewMonthSelectorYear < int.parse(currentYear)
                      ? AppColors.appPrimaryBlue
                      : AppColors.grey),
            ),
          ],
        ),
        Container(
          height: 150.sp,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2 / 1, // 控制每個物件的寬高比例
            ),
            itemCount: monthList.length,
            itemBuilder: (context, index) {
              bool isSelected = (monthSelectorIndex == index) && (viewMonthSelectorYear == tempMonthSelectorYear);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    chooseMonth =
                        "${viewMonthSelectorYear.toString().padLeft(4, '0')}-${monthMap[monthList[index]].toString().padLeft(2, '0')}";
                    monthSelectorIndex = index;
                    widget.chooseDate(
                        null, chooseMonth, null, dateSwitcherIndex);
                    Navigator.of(context).pop();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: isSelected
                        ? AppColors.appPrimaryBlue
                        : (viewMonthSelectorYear.toString() == currentYear) &&
                                (addLeadingZero((index + 1).toString()) ==
                                    currentMonth)
                            ? AppColors.milkBlue
                            : AppColors.transparent,
                  ),
                  height: 28.sp,
                  width: 48.sp,
                  alignment: Alignment.center,
                  child: getText(monthList[index],
                      fontSize: 16.sp,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected
                          ? AppColors.white
                          : (viewMonthSelectorYear.toString() == currentYear) &&
                                  (addLeadingZero((index + 1).toString()) ==
                                      currentMonth)
                              ? AppColors.appPrimaryBlue
                              : AppColors.primaryBlack),
                ),
              );
            },
          ),
        ),
        GestureDetector(onTap: (){
          setState(() {
            viewMonthSelectorYear = int.parse(currentYear);
          });
        }, child: Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getImageIcon("pick_calendar.png", height: 24.sp, width: 24.sp, color: AppColors.appPrimaryBlue),
            SizedBox(
              width: 4.sp,
            ),
            getText(AppTexts.returnToCurrentTime, fontSize: 16.sp, color: AppColors.appPrimaryBlue)
          ],
        )),),SizedBox(height: 12.sp,)
      ],
    );
  }

  Widget yearSelectorWidget() {
    ScrollController _scrollController = ScrollController();

    void scrollToSelectedYear() {
      if (_scrollController.hasClients) {
        final double itemWidth =
            MediaQuery.of(context).size.width / 5; // 每個項目的寬度，根據您的UI設計進行調整
        final double offset = (yearSelectorIndex != -1)
            ? (yearSelectorIndex * itemWidth) - (itemWidth * 2)
            : ((yearList.length - 1) * itemWidth) - (itemWidth * 2); //
        // 將所選項滾動到視圖中間
        _scrollController.animateTo(
          offset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollToSelectedYear();
    });

    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(12.sp, 0, 0, 0),
            height: 36.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: yearList.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = yearSelectorIndex == index;
                bool isCurrentYear = currentYearSelectorIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (yearSelectorIndex != index) {
                        yearSelectorIndex = index;
                        chooseYear = yearList[index];
                        widget.chooseDate(
                            null, null, chooseYear, dateSwitcherIndex);
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: isSelected
                          ? AppColors.appPrimaryBlue
                          : isCurrentYear
                              ? AppColors.milkBlue
                              : AppColors.white,
                    ),
                    child: getText(yearList[index],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? AppColors.white
                            : isCurrentYear
                                ? AppColors.appPrimaryBlue
                                : AppColors.primaryBlack),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 12.sp);
              },
            )),
        SizedBox(height: 24.sp,),
        GestureDetector(onTap: (){
          if (_scrollController.hasClients) {
            final double itemWidth =
                MediaQuery.of(context).size.width / 5; // 每個項目的寬度，根據您的UI設計進行調整
            final double offset = ((yearList.length - 1) * itemWidth) - (itemWidth * 2);
            // 將所選項滾動到視圖中間
            _scrollController.animateTo(
              offset,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        }, child: Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getImageIcon("pick_calendar.png", height: 24.sp, width: 24.sp, color: AppColors.appPrimaryBlue),
            SizedBox(
              width: 4.sp,
            ),
            getText(AppTexts.returnToCurrentTime, fontSize: 16.sp, color: AppColors.appPrimaryBlue)
          ],
        )),),SizedBox(height: 12.sp,)
      ],
    );
  }
}
