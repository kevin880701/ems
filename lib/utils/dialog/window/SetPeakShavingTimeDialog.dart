import 'package:ems_app/data/Params.dart';
import 'package:ems_app/data/apiRequest/setPeakShavingModeTime/SetPeakShavingModeTimeBody.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../viewModel/EnergyModeViewModel.dart';
import '../DialogManager.dart';
import '../widget/DialogTitleBar.dart';
import '../widget/TimeRangeWidget.dart';
import 'PeakShavingChooseTimeDialog.dart';

class SetPeakShavingTimeDialog extends StatefulWidget {
  const SetPeakShavingTimeDialog({
    super.key,
  });

  @override
  _SetPeakShavingTimeDialog createState() => _SetPeakShavingTimeDialog();
}

class _SetPeakShavingTimeDialog extends State<SetPeakShavingTimeDialog> {
  EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;

  bool showPeriod2 = false;

  @override
  void initState() {
    super.initState();

    if (energyModeViewModel.modeData.peakShavingChargeStart2Time != null ||
        energyModeViewModel.modeData.peakShavingDischargeStart2Time != null) {
      showPeriod2 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
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
                DialogTitleBar(
                  title: AppTexts.setChargingTime,
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
                Container(
                  padding: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 24.sp),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                getText(AppTexts.period1, fontSize: 18.sp),
                                Container(
                                  width: 24.sp,
                                  height: 2.sp,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: showPeriod2,
                            child: SizedBox(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showPeriod2 = false;
                                    energyModeViewModel.modeData
                                      ..peakShavingChargeStart1Time = energyModeViewModel.modeData.peakShavingChargeStart2Time
                                      ..peakShavingChargeEnd1Time = energyModeViewModel.modeData.peakShavingChargeEnd2Time
                                      ..peakShavingDischargeStart1Time = energyModeViewModel.modeData.peakShavingDischargeStart2Time
                                      ..peakShavingDischargeEnd1Time = energyModeViewModel.modeData.peakShavingDischargeEnd2Time
                                      ..peakShavingChargeStart2Time = null
                                      ..peakShavingChargeEnd2Time = null
                                      ..peakShavingDischargeStart2Time = null
                                      ..peakShavingDischargeEnd2Time = null;

                                    energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                                      energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd2Time,
                                    ));
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    getImageIcon("delete.png", width: 24.sp, color: AppColors.red),
                                    getText(AppTexts.delete, fontSize: 14.sp, color: AppColors.red),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      timeRangeWidget(AppTexts.charge, energyModeViewModel.modeData.peakShavingChargeStart1Time,
                          energyModeViewModel.modeData.peakShavingChargeEnd1Time, () async {
                        showChooseTimeDialog(
                            context,
                            PeakShavingChooseTimeDialog(
                              typeName: AppTexts.charge,
                              defaultTimeRange: findClosestTimeIndex(energyModeViewModel.modeData
                                .peakShavingChargeStart1Time,
                                  energyModeViewModel.modeData.peakShavingChargeEnd1Time),
                              timeRange2: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                  energyModeViewModel.modeData.peakShavingDischargeEnd1Time),
                              timeRange3: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingChargeEnd2Time),
                              timeRange4: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingDischargeEnd2Time),
                            )).then((value) {
                          setState(() {
                            energyModeViewModel.modeData
                              ..peakShavingChargeStart1Time = value.item1
                              ..peakShavingChargeEnd1Time = value.item2;
                            energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                              energyModeViewModel.modeData.peakShavingChargeStart1Time,
                              energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                              energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                              energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                              energyModeViewModel.modeData.peakShavingChargeStart2Time,
                              energyModeViewModel.modeData.peakShavingChargeEnd2Time,
                              energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                              energyModeViewModel.modeData.peakShavingDischargeEnd2Time,
                            )).then((_){
                              showToast(
                                context: context,
                                text: AppTexts.saved,
                                textColor: AppColors.white,
                                backgroundColor: AppColors.lightBlue,);
                            });
                          });
                        });
                      }),
                      SizedBox(
                        height: 16.sp,
                      ),
                      timeRangeWidget(AppTexts.discharge, energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                          energyModeViewModel.modeData.peakShavingDischargeEnd1Time, () async {
                        showChooseTimeDialog(
                            context,
                            PeakShavingChooseTimeDialog(
                              typeName: AppTexts.discharge,
                              defaultTimeRange: findClosestTimeIndex(energyModeViewModel.modeData
                                  .peakShavingDischargeStart1Time,
                                  energyModeViewModel.modeData.peakShavingDischargeEnd1Time),
                              timeRange2: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                  energyModeViewModel.modeData.peakShavingChargeEnd1Time),
                              timeRange3: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingChargeEnd2Time),
                              timeRange4: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingDischargeEnd2Time),
                            )).then((value) {
                          setState(() {
                            energyModeViewModel.modeData
                              ..peakShavingDischargeStart1Time = value.item1
                              ..peakShavingDischargeEnd1Time = value.item2;
                            energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                              energyModeViewModel.modeData.peakShavingChargeStart1Time,
                              energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                              energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                              energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                              energyModeViewModel.modeData.peakShavingChargeStart2Time,
                              energyModeViewModel.modeData.peakShavingChargeEnd2Time,
                              energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                              energyModeViewModel.modeData.peakShavingDischargeEnd2Time,
                            )).then((_){
                              showToast(
                                context: context,
                                text: AppTexts.saved,
                                textColor: AppColors.white,
                                backgroundColor: AppColors.lightBlue,);
                            });
                          });
                        });
                      }),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Visibility(
                        visible: !showPeriod2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPeriod2 = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getImageIcon("add.png", width: 24.sp, color: AppColors.lightBlue),
                              getText(AppTexts.addPeriod, fontSize: 16.sp, color: AppColors.lightBlue),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                          visible: showPeriod2,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        getText(AppTexts.period2, fontSize: 18.sp),
                                        Container(
                                          width: 24.sp,
                                          height: 2.sp,
                                          color: AppColors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: showPeriod2,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                            energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                                              energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                              energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                                              energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                              energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                                              "0000",
                                              "0000",
                                              "0000",
                                              "0000",
                                            )).then((isChangeSuccess){
                                              setState(() {
                                                energyModeViewModel.modeData
                                                  ..peakShavingChargeStart2Time = null
                                                ..peakShavingChargeEnd2Time = null
                                                ..peakShavingDischargeStart2Time = null
                                                ..peakShavingDischargeEnd2Time = null;
                                                showPeriod2 = false;
                                              });
                                            });
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            getImageIcon("delete.png", width: 24.sp, color: AppColors.red),
                                            getText(AppTexts.delete, fontSize: 14.sp, color: AppColors.red),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.sp,
                              ),
                              timeRangeWidget(
                                  AppTexts.charge,
                                  energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingChargeEnd2Time, () async {
                                showChooseTimeDialog(
                                    context,
                                    PeakShavingChooseTimeDialog(
                                      typeName: AppTexts.charge,
                                      defaultTimeRange: findClosestTimeIndex(
                                          energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                          energyModeViewModel.modeData.peakShavingChargeEnd2Time),
                                      timeRange2: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                          energyModeViewModel.modeData.peakShavingDischargeEnd1Time),
                                      timeRange3: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                          energyModeViewModel.modeData.peakShavingChargeEnd1Time),
                                      timeRange4: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                          energyModeViewModel.modeData.peakShavingDischargeEnd2Time),
                                    )).then((value) {
                                  setState(() {
                                    energyModeViewModel.modeData
                                      ..peakShavingChargeStart2Time = value.item1
                                      ..peakShavingChargeEnd2Time = value.item2;
                                    energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                                      energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd2Time,
                                    )).then((_){
                                      showToast(
                                        context: context,
                                        text: AppTexts.saved,
                                        textColor: AppColors.white,
                                        backgroundColor: AppColors.lightBlue,);
                                    });
                                  });
                                });
                              }),
                              SizedBox(
                                height: 16.sp,
                              ),
                              timeRangeWidget(
                                  AppTexts.discharge,
                                  energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                  energyModeViewModel.modeData.peakShavingDischargeEnd2Time, () async {
                                showChooseTimeDialog(
                                    context,
                                    PeakShavingChooseTimeDialog(
                                      typeName: AppTexts.discharge,
                                      defaultTimeRange: findClosestTimeIndex(
                                          energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                          energyModeViewModel.modeData.peakShavingDischargeEnd2Time),
                                      timeRange2: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                          energyModeViewModel.modeData.peakShavingDischargeEnd1Time),
                                      timeRange3: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                          energyModeViewModel.modeData.peakShavingChargeEnd2Time),
                                      timeRange4: findClosestTimeIndex(energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                          energyModeViewModel.modeData.peakShavingChargeEnd1Time),
                                    )).then((value) {
                                  setState(() {
                                    energyModeViewModel.modeData
                                      ..peakShavingDischargeStart2Time = value.item1
                                      ..peakShavingDischargeEnd2Time = value.item2;
                                    energyModeViewModel.setPeakShavingModeTime(SetPeakShavingModeTimeBody.create(
                                      energyModeViewModel.modeData.peakShavingChargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart1Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd1Time,
                                      energyModeViewModel.modeData.peakShavingChargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingChargeEnd2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeStart2Time,
                                      energyModeViewModel.modeData.peakShavingDischargeEnd2Time,
                                    )).then((_){
                                      showToast(
                                        context: context,
                                        text: AppTexts.saved,
                                        textColor: AppColors.white,
                                        backgroundColor: AppColors.lightBlue,);
                                    });
                                  });
                                });
                              }),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
