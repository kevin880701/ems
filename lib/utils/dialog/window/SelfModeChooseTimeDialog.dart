import 'package:ems_app/data/apiRequest/setSelfUseModeTime/SetSelfUseModeTimeBody.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../data/Params.dart';
import '../../../viewModel/EnergyModeViewModel.dart';
import '../widget/DialogTitleBar.dart';

class SelfModeChooseTimeDialog extends StatefulWidget {
  const SelfModeChooseTimeDialog({
    super.key,
    required this.typeName,
    required this.timeIndexes,
  });

  final String typeName;
  final Tuple2<int, int> timeIndexes; // 改為 Tuple2<int, int>

  @override
  _SelfModeChooseTimeDialog createState() => _SelfModeChooseTimeDialog();
}

class _SelfModeChooseTimeDialog extends State<SelfModeChooseTimeDialog> {
  EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;
  late double screenWidth;
  int clickCount = 0;
  late int startIndex;
  late int endIndex;

  @override
  void initState() {
    super.initState();
    // 使用 Tuple2 的 item1 和 item2
    startIndex = widget.timeIndexes.item1;
    endIndex = widget.timeIndexes.item2;
    if (startIndex != -1 && endIndex != -1) {
      clickCount = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      alignment: Alignment.topCenter,
      insetPadding: EdgeInsets.fromLTRB(0.sp, 90.sp, 0.sp, 0.sp),
      child: Container(
        alignment: Alignment.topCenter,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(0.sp, 8.sp, 0.sp, 0.sp),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DialogTitleBar(
                title: AppTexts.chooseTime,
                rightWidget: getGestureImage("dialog_cancel.png", height: 32.sp, width: 32.sp, onTap: () {
                  Navigator.of(context).pop();
                })),
            SizedBox(
              height: 8.sp,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(24.sp, 4.sp, 24.sp, 8.sp),
                      child: Column(
                        children: [
                          timePeriodTitle(AppTexts.morning, morningPeriod),
                          timePeriodTitle(AppTexts.afternoon, afternoonPeriod),
                        ],
                      ),
                    ))),
            Container(
              height: 1.sp,
              color: AppColors.borderGrey,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(12.sp, 24.sp, 12.sp, 24.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText(widget.typeName,
                      fontSize: 16.sp,
                      color: (widget.typeName == AppTexts.charge) ? AppColors.green : AppColors.orange),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.sp, 4.sp, 16.sp, 4.sp),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: AppColors.borderLightGrey,
                    ),
                    child: getText(
                        (startIndex == -1)
                            ? "${String.fromCharCode(0x2002)}${String.fromCharCode(0x2002)}-${String.fromCharCode(0x2002)}${String.fromCharCode(0x2002)}"
                            : addTimeColon(timeList[startIndex]),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.primaryBlack),
                  ),
                  getImageIcon("arrow_right2.png", width: 16.sp, height: 16.sp, color: AppColors.grey),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.sp, 4.sp, 16.sp, 4.sp),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: AppColors.borderLightGrey,
                    ),
                    child: getText(
                        (endIndex == -1)
                            ? "${String.fromCharCode(0x2002)}${String.fromCharCode(0x2002)}-${String.fromCharCode(0x2002)}${String.fromCharCode(0x2002)}"
                            : addTimeColon(timeList[endIndex]),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.primaryBlack),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (((startIndex != -1) && (endIndex != -1))) {
                        energyModeViewModel.setSelfUseModeTime(SetSelfUseModeTimeBody.create(timeList[startIndex], timeList[endIndex]));
                        energyModeViewModel.modeData
                          ..selfModeStartTime = timeList[startIndex]
                          ..selfModeEndTime = timeList[endIndex];
                        Navigator.pop(context, Tuple2(startIndex, endIndex));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color:((startIndex == -1) || (endIndex == -1))?AppColors.disableGrey:AppColors.lightBlue,
                      ),
                      child: getText(AppTexts.save, fontSize: 18.sp, color: AppColors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget timePeriodTitle(String text, List<int> timePeriod) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.sp),
          child: Row(
            children: [
              getText(text, fontWeight: FontWeight.w400, color: AppColors.grey, fontSize: 16.sp),
              SizedBox(
                width: 8.sp,
              ),
              Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: getDashedLine(color: AppColors.grey),
                  ))
            ],
          ),
        ),
        GridView.extent(
          maxCrossAxisExtent: screenWidth / 3,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 10.sp,
          childAspectRatio: 2.3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: timePeriod.map((int index) {
            Color itemBorderColor = AppColors.borderGrey;
            Color itemTextColor = AppColors.primaryBlack;
            Color itemBackgroundColor = AppColors.white;
            Color indicatorColor = AppColors.transparent;
            bool isEnabled = true;
            if (index == startIndex || index == endIndex) {
              // 如果是開始或結束時間
              itemBorderColor = AppColors.lightBlue;
              itemTextColor = AppColors.white;
              itemBackgroundColor = AppColors.lightBlue;
              indicatorColor = AppColors.white;
              isEnabled = true;
            } else if (index >= startIndex && index <= endIndex && startIndex != -1) {
              // 如果在被選取的範圍內
              itemBorderColor = AppColors.lightBlue;
              itemTextColor = AppColors.white;
              itemBackgroundColor = AppColors.lightBlue;
              indicatorColor = AppColors.lightBlue;
              isEnabled = false;
            } else if ((startIndex != -1 && index < startIndex) || (endIndex != -1 && index > endIndex)) {
              // 如果在開始時間前或在開始時間後
              itemBorderColor = AppColors.borderGrey;
              itemTextColor = AppColors.grey;
              itemBackgroundColor = AppColors.borderGrey;
              indicatorColor = AppColors.borderGrey;
              isEnabled = false;
            }
            return GestureDetector(
              onTap: (isEnabled)
                  ? () {
                setState(() {
                  if (clickCount == 0) {
                    // 第一次點擊代表選開始時間
                    startIndex = index;
                    clickCount++;
                  } else if (clickCount == 1 && index == startIndex) {
                    // 第二次點擊但卻點到開始時間等於重設開始時間
                    startIndex = -1;
                    clickCount = 0;
                  } else if (clickCount == 1 && index != startIndex) {
                    // 第二次點擊並且沒點到開始時間等於設定結束時間
                    endIndex = index;
                    clickCount++;
                  } else if (clickCount > 1 && index == startIndex) {
                    // 第二次點擊後點到開始時間等於重設開始時間
                    if (endIndex == -1) {
                      clickCount = 0;
                    }
                    startIndex = -1;
                  } else if (clickCount > 1 && index == endIndex) {
                    // 第二次點擊後點到結束時間等於重設結束時間
                    if (startIndex == -1) {
                      clickCount = 0;
                    }
                    endIndex = -1;
                  } else if (index != startIndex || index != endIndex) {
                    // 第二次點擊後如果有其中一個時間未設置並則設定對應時間
                    if (startIndex == -1) {
                      startIndex = index;
                    } else if (endIndex == -1) {
                      endIndex = index;
                    }
                  }
                });
              }
                  : null,
              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(18.sp, 8.sp, 18.sp, 4.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: itemBorderColor),
                      borderRadius: BorderRadius.circular(4),
                      color: itemBackgroundColor),
                  child: Column(
                    children: [
                      getText(addTimeColon(timeList[index]), fontWeight: FontWeight.w400, fontSize: 16.sp, color: itemTextColor),
                      Container(
                        width: 12.sp,
                        height: 2.sp,
                        color: indicatorColor,
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
