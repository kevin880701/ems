import 'package:ems_app/data/Params.dart';
import 'package:ems_app/data/apiRequest/setSelfUseModeTime/SetSelfUseModeTimeBody.dart';
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../viewModel/EnergyModeViewModel.dart';
import '../DialogManager.dart';
import '../widget/DialogTitleBar.dart';
import '../widget/TimeRangeWidget.dart';
import 'SelfModeChooseTimeDialog.dart';

class SetSelfModeTimeDialog extends StatefulWidget {
  const SetSelfModeTimeDialog({
    super.key,
  });

  @override
  _SetSelfModeTimeDialog createState() => _SetSelfModeTimeDialog();
}

class _SetSelfModeTimeDialog extends State<SetSelfModeTimeDialog> {
  EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;

  @override
  void initState() {
    super.initState();
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
                  padding: EdgeInsets.fromLTRB(24.sp, 8.sp, 24.sp, 54.sp),
                  child: Column(
                    children: [
                      timeRangeWidget(AppTexts.charge, energyModeViewModel.modeData.selfModeStartTime,
                          energyModeViewModel.modeData.selfModeEndTime, () async {
                        showChooseTimeDialog(
                                context,
                                SelfModeChooseTimeDialog(
                                    typeName: AppTexts.charge,
                                    timeIndexes: findClosestTimeIndex(energyModeViewModel.modeData
                                        .selfModeStartTime, energyModeViewModel.modeData.selfModeEndTime,),))
                            .then((value) {
                          setState(() {
                            // energyModeViewModel.modeData
                            //   ..selfModeStartIndex = value.item1
                            //   ..selfModeEndIndex = value.item2;
                            energyModeViewModel.setSelfUseModeTime(SetSelfUseModeTimeBody.create(
                              energyModeViewModel.modeData.selfModeStartTime,
                              energyModeViewModel.modeData.selfModeEndTime,
                            ));
                            showToast(
                                context: context,
                                text: AppTexts.saved,
                                textColor: AppColors.white,
                                backgroundColor: AppColors.lightBlue,);
                          });
                        });
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
