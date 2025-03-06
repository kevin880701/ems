import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';
import '../../../viewModel/EnergyModeViewModel.dart';

class ModeWidget extends StatefulWidget {
  const ModeWidget({super.key});

  @override
  _ModeWidget createState() => _ModeWidget();
}

class _ModeWidget extends State<ModeWidget> {
  EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<EnergyModeViewModel>(
        builder: (context, energyModeViewModel, _) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(energyModeViewModel.modeData.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(energyModeViewModel.modeData.modeName,
                                  fontSize: 16.sp,
                                  color: AppColors.white),
                              getText(energyModeViewModel.modeData.modeDescription,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ],
                          ),
                        ),
                        getImageIcon('arrow_right.png',
                            width: 24.w, height: 24.h, color: AppColors.white),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(  // 因為目前查不到已執行時間，故先註解
              //   padding: EdgeInsets.all(20.sp),
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.zero,
              //       topRight: Radius.zero,
              //       bottomLeft: Radius.circular(16),
              //       bottomRight: Radius.circular(16),
              //     ),
              //     color: AppColors.white,
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             getText(AppTexts.executionTime,
              //                 fontSize: 14.sp,),
              //             SizedBox(height: 8.h,),
              //             Row(
              //               children: [
              //                 getText("3",
              //                     fontSize: 18.sp,
              //                     fontWeight: FontWeight.w600,
              //                     color: AppColors.primaryBlack),
              //                 SizedBox(width: 4.w,),
              //                 getText(AppTexts.day,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                     color: AppColors.grey),
              //                 SizedBox(width: 8.w,),
              //                 getText("15",
              //                     fontSize: 18.sp,
              //                     fontWeight: FontWeight.w600,
              //                     color: AppColors.primaryBlack),
              //                 SizedBox(width: 4.w,),
              //                 getText(AppTexts.hour,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                     color: AppColors.grey),
              //                 SizedBox(width: 8.w,),
              //                 getText("41",
              //                     fontSize: 18.sp,
              //                     fontWeight: FontWeight.w600,
              //                     color: AppColors.primaryBlack),
              //                 SizedBox(width: 4.w,),
              //                 getText(AppTexts.minute,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w400,
              //                     color: AppColors.grey),
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               getText(fieldName,
              //                   fontSize: 14.sp,),
              //               SizedBox(height: 8.h,),
              //               Row(
              //                 children: [
              //                   getText("39",
              //                       fontSize: 18.sp,),
              //                   SizedBox(width: 4.w,),
              //                   getText(AppTexts.kilowatt,
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w400,
              //                       color: AppColors.grey),
              //                 ],
              //               )
              //             ],
              //           )),
              //     ],
              //   ),
              // )
            ],
          );
        } )
      ;
  }
}
