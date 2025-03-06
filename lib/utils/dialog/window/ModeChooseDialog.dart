import 'package:ems_app/data/apiRequest/sendBatteryPriorityModeCmd/SendBatteryPriorityModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendPeakShavingModeCmd/SendPeakShavingModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendSelfUseModeCmd/SendSelfUseModeCmdBody.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../viewModel/EnergyModeViewModel.dart';
import '../../../viewModel/EnergyStorageViewModel.dart';
import '../DialogManager.dart';
import 'SetPeakShavingTimeDialog.dart';
import 'SetSelfModeTimeDialog.dart';

class ModeChooseDialog extends StatefulWidget {
  const ModeChooseDialog({super.key});

  @override
  _ModeChooseDialog createState() => _ModeChooseDialog();
}

class _ModeChooseDialog extends State<ModeChooseDialog> {
  EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  String touchModeName = "";
  int itemCount = 3;

  @override
  void initState() {
    super.initState();
    touchModeName = energyModeViewModel.modeData.modeName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.sp, 36.sp, 10.sp, 60.sp),
      color: AppColors.black.withOpacity(0.65),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.sp, 0, 8.sp, 0),
            child: Row(
              children: [
                getText(AppTexts.chooseModel, fontSize: 20.sp, color: AppColors.white),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: getImage("cancel.png", height: 32.sp, width: 32.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.sp,
          ),
          selfModelItemWidget(AppTexts.selfMode, AppTexts.selfModeSubTitle, 'assets/images/model1.png', true, false),
          peakShavingModelItem(
              AppTexts.peakShavingMode, AppTexts.peakShavingModeSubTitle, 'assets/images/model2.png', true, true),
          batteryFirstModelItem(AppTexts.batteryPriorityMode, AppTexts.batteryPriorityModeSubTitle,
              'assets/images/model3.png', false, false),
          Spacer(),
          InkWell(
              onTap: () {
                if (energyModeViewModel.modeData.modeName != touchModeName) {
                  if (touchModeName == AppTexts.batteryPriorityMode) {
                    energyModeViewModel.setModeData(AppTexts.batteryPriorityMode);
                    // 發送電池優先命令
                    energyModeViewModel.sendBatteryPriorityModeCmd(SendBatteryPriorityModeCmdBody(s8: '2'));
                    showToast(
                      context: context,
                        text: AppTexts.saved,
                        textColor: AppColors.white,
                        backgroundColor: AppColors.lightBlue,);
                    Navigator.of(context).pop();
                  } else if (touchModeName == AppTexts.selfMode) {
                    if (energyModeViewModel.modeData.selfModeStartTime == null ||
                        energyModeViewModel.modeData.selfModeEndTime == null) {
                      showToast(
                        context: context,
                        text: AppTexts.selfMode + "尚未設定時間",
                        alignment: Alignment.bottomCenter,
                        backgroundColor: AppColors.red,
                        textColor: AppColors.white,
                      );
                    } else {
                      // 發送自發自用命令
                      energyModeViewModel.sendSelfUseModeCmd(SendSelfUseModeCmdBody.create());
                      energyModeViewModel.setModeData(AppTexts.selfMode);
                      showToast(
                        context: context,
                          text: AppTexts.saved,
                          textColor: AppColors.white,
                          backgroundColor: AppColors.lightBlue,);
                      Navigator.of(context).pop();
                    }
                  } else if (touchModeName == AppTexts.peakShavingMode) {
                    if (energyModeViewModel.modeData.peakShavingChargeStart1Time == null ||
                        energyModeViewModel.modeData.peakShavingDischargeStart1Time == null) {
                      showToast(
                        context: context,
                        text: AppTexts.peakShavingMode + "尚未設定時間",
                        alignment: Alignment.bottomCenter,
                        backgroundColor: AppColors.red,
                        textColor: AppColors.white,
                      );
                    } else {
                      // 發送削峰填谷命令
                      energyModeViewModel.sendPeakShavingModeCmd(SendPeakShavingModeCmdBody.create());
                      energyModeViewModel.setModeData(AppTexts.peakShavingMode);
                      showToast(
                          context: context,
                          text: AppTexts.saved,
                          textColor: AppColors.white,
                          backgroundColor: AppColors.lightBlue,);
                      Navigator.of(context).pop();
                    }
                  }
                }
              },
              child: Container(
                width: 318.w,
                height: 48.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: energyModeViewModel.modeData.modeName == touchModeName
                      ? AppColors.disableGrey
                      : AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: getText(AppTexts.confirm, fontSize: 16.sp, color: AppColors.white),
                ),
              ))
        ],
      ),
    );
  }

  Widget itemMainWidget(
      String modeName, String modeDescription, String image, bool isSetChargingTime, bool isSetDischargingTime) {
    return Stack(
      children: [
        Container(
          child: ClipRRect(
            // 因為目前點擊後不會顯示詳細資訊，圖片暫時用固定四邊圓角
            borderRadius: BorderRadius.circular(8),
            // borderRadius: touchModeName != modeName
            //     ? BorderRadius.circular(8)
            //     : BorderRadius.only(
            //         topLeft: Radius.circular(8),
            //         topRight: Radius.circular(8),
            //       ),
            child: Container(
              height: 80.sp,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20.sp, 0, 20.sp, 0),
          height: 80.sp,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(modeName, fontSize: 16.sp, color: AppColors.white),
                  getText(modeDescription, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.white),
                ],
              ),
              const Spacer(),
              (isSetChargingTime)
                  ? GestureDetector(
                      onTap: () {
                          if (modeName == AppTexts.selfMode) {
                            showSetTimeDialogDialog(context, const SetSelfModeTimeDialog());
                          } else {
                            showSetTimeDialogDialog(context, const SetPeakShavingTimeDialog());
                          }
                      },
                      child: getImageIcon("time_icon.png", height: 28.sp, width: 28.sp, color: AppColors.white),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Widget selfModelItemWidget(
      String modeName, String subTitle, String image, bool isSetChargingTime, bool isSetDischargingTime) {
    return GestureDetector(
      onTap: () {
        setState(() {
          touchModeName = modeName;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: touchModeName == modeName
                  ? AppColors.lightBlue
                  : energyModeViewModel.modeData.modeName == modeName
                      ? AppColors.darkGrey
                      : AppColors.black.withOpacity(0.0),
              width: 4.sp),
        ),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: AppColors.white),
          child: Column(
            children: [
              itemMainWidget(modeName, subTitle, image, isSetChargingTime, isSetDischargingTime),
              Visibility(
                // visible: touchModeName == modeName, // 因為目前查不到已執行時間，故先註解
                visible: false,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 16.sp),
                  child: Column(
                    children: [
                      Column(children: [
                        Row(
                          children: [
                            getImageIcon("time_icon.png", height: 24.sp, width: 24.sp, color: AppColors.grey),
                            getText(
                                (energyModeViewModel.modeData.modeName == modeName)
                                    ? AppTexts.executionTime
                                    : AppTexts.lastUsed,
                                fontSize: 16.sp),
                            Spacer(),
                            getText("3", fontSize: 24.sp),
                            SizedBox(
                              width: 4.sp,
                            ),
                            getText(AppTexts.day, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                            SizedBox(
                              width: 4.sp,
                            ),
                            getText("12", fontSize: 24.sp),
                            SizedBox(
                              width: 4.sp,
                            ),
                            getText(AppTexts.hour, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                            SizedBox(
                              width: 4.sp,
                            ),
                            getText("19", fontSize: 24.sp),
                            SizedBox(
                              width: 4.sp,
                            ),
                            getText(AppTexts.minute,
                                fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                          ],
                        ),
                        (energyModeViewModel.modeData.modeName != modeName)
                            ? getText("2024.01.18 ~ 2024.02.15",
                                fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.grey)
                            : SizedBox()
                      ]),
                      Container(
                        height: 1.sp,
                        color: AppColors.borderGrey,
                      ),
                      Row(
                        children: [
                          getImageIcon("flash.png", height: 24.sp, width: 24.sp, color: AppColors.grey),
                          getText(AppTexts.energyStorageAccumulatedPowerSupply, fontSize: 16.sp),
                          Spacer(),
                          getText("3", fontSize: 24.sp),
                          SizedBox(
                            width: 4.sp,
                          ),
                          getText(AppTexts.kilowatt,
                              fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget peakShavingModelItem(
      String modeName, String subTitle, String image, bool isSetTime, bool isSetDischargingTime) {
    return GestureDetector(
      onTap: () {
        setState(() {
          touchModeName = modeName;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: touchModeName == modeName
                  ? AppColors.lightBlue
                  : energyModeViewModel.modeData.modeName == modeName
                      ? AppColors.darkGrey
                      : AppColors.black.withOpacity(0.0),
              width: 4.sp),
        ),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: AppColors.white),
          child: Column(
            children: [
              itemMainWidget(modeName, subTitle, image, isSetTime, isSetDischargingTime),
              Visibility(
                // visible: touchModeName == modeName, // 因為目前查不到已執行時間，故先註解
                visible: false,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 16.sp),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              getImageIcon("time_icon.png", height: 24.sp, width: 24.sp, color: AppColors.grey),
                              getText(
                                  (energyModeViewModel.modeData.modeName == modeName)
                                      ? AppTexts.executionTime
                                      : AppTexts.lastUsed,
                                  fontSize: 16.sp),
                              Spacer(),
                              getText("3", fontSize: 24.sp),
                              SizedBox(
                                width: 4.sp,
                              ),
                              getText(AppTexts.day,
                                  fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                              SizedBox(
                                width: 4.sp,
                              ),
                              getText("12", fontSize: 24.sp),
                              SizedBox(
                                width: 4.sp,
                              ),
                              getText(AppTexts.hour,
                                  fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                              SizedBox(
                                width: 4.sp,
                              ),
                              getText("19", fontSize: 24.sp),
                              SizedBox(
                                width: 4.sp,
                              ),
                              getText(AppTexts.minute,
                                  fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                            ],
                          ),
                          (energyModeViewModel.modeData.modeName != modeName)
                              ? getText("2024.01.18 ~ 2024.02.15",
                                  fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.grey)
                              : SizedBox()
                        ],
                      ),
                      Container(
                        height: 1.sp,
                        color: AppColors.borderGrey,
                      ),
                      Row(
                        children: [
                          getImageIcon("flash.png", height: 24.sp, width: 24.sp, color: AppColors.grey),
                          getText(AppTexts.energyStorageAccumulatedPowerSupply, fontSize: 16.sp),
                          Spacer(),
                          getText("3", fontSize: 24.sp),
                          SizedBox(
                            width: 4.sp,
                          ),
                          getText(AppTexts.kilowatt,
                              fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget batteryFirstModelItem(
      String modeName, String subTitle, String image, bool isSetTime, bool isSetDischargingTime) {
    var hb3445 = energyStorageViewModel.batteryInformation!.vals?.hb3445;
    var hb3455 = energyStorageViewModel.batteryInformation!.vals?.hb3455;
    var hb3489 = energyStorageViewModel.batteryInformation!.vals?.hb3489;
    var hb3499 = energyStorageViewModel.batteryInformation!.vals?.hb3499;
    var hb3533 = energyStorageViewModel.batteryInformation!.vals?.hb3533;
    var hb3543 = energyStorageViewModel.batteryInformation!.vals?.hb3543;
    var hb3577 = energyStorageViewModel.batteryInformation!.vals?.hb3577;
    var hb3587 = energyStorageViewModel.batteryInformation!.vals?.hb3587;
    var value = (((hb3445.stringToInt() ?? 0) * (hb3455.stringToInt() ?? 0)) / 1000 +
        ((hb3489.stringToInt() ?? 0) * (hb3499.stringToInt() ?? 0)) / 1000 +
        ((hb3533.stringToInt() ?? 0) * (hb3543.stringToInt() ?? 0)) / 1000 +
        ((hb3577.stringToInt() ?? 0) * (hb3587.stringToInt() ?? 0)) / 1000)
        .toInt();

    return GestureDetector(
      onTap: () {
        setState(() {
          touchModeName = modeName;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: touchModeName == modeName
                  ? AppColors.lightBlue
                  : energyModeViewModel.modeData.modeName == modeName
                      ? AppColors.darkGrey
                      : AppColors.black.withOpacity(0.0),
              width: 4.sp),
        ),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: AppColors.white),
          child: Column(
            children: [
              itemMainWidget(modeName, subTitle, image, isSetTime, isSetDischargingTime),
              Visibility(
                // visible: touchModeName == modeName, // 因為目前查不到已執行時間，故先註解
                visible: false,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 16.sp),
                  child: Row(
                    children: [
                      getImageIcon("battery_half_icon.png", height: 24.sp, width: 24.sp, color: AppColors.grey),
                      getText(AppTexts.remainingBattery, fontSize: 16.sp),
                      Spacer(),
                      getText(energyStorageViewModel.batteryInformation!.vals?.brBattery?.toString() ?? '', fontSize: 24
                          .sp),
                      SizedBox(
                        width: 4.sp,
                      ),
                      getText(AppTexts.percent, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Container(
                        height: 20.sp,
                        width: 1.sp,
                        color: AppColors.borderGrey,
                      ),
                      SizedBox(
                        width: 2.sp,
                      ),
                      getText(value.toString(), fontSize: 24.sp),
                      SizedBox(
                        width: 4.sp,
                      ),
                      getText(AppTexts.kilowatt, fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
