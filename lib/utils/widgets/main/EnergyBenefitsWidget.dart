import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../data/fakeData/FakeData.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';
import '../chart/pieChart/BaselinePieChart.dart';

class EnergyBenefitsWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final List<EnergyBenefitsData> energyBenefitsDataList;

  const EnergyBenefitsWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.energyBenefitsDataList,
  });

  @override
  _EnergyBenefitsWidget createState() => _EnergyBenefitsWidget();
}

class _EnergyBenefitsWidget extends State<EnergyBenefitsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.w, 12.h, 8.w, 12.h),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(widget.title,
              textAlign: TextAlign.start,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey),
          getText(widget.subTitle,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlack),
          for (int i = 0; i < energyBenefitsDataList.length; i++)
            item(
              energyBenefitsDataList[i].image,
              energyBenefitsDataList[i].title,
              energyBenefitsDataList[i].value,
              energyBenefitsDataList[i].unit,
              i,
            ),
        ],
      ),
    );
  }

  Widget item(String image, String title, String value, String unit, int index) {
    return Container(
      margin: EdgeInsets.only(top: 12.sp),
      child: Column(
        children: [
          Row(
            children: [
              getImage(
                image,
                width: 48.sp,
                height: 48.sp,
              ),
              SizedBox(
                width: 4.sp,
              ),
              getText(title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBlack),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getText(value,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlack),
                  getText(unit,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey),
                ],
              ),
              SizedBox(
                width: 4.sp,
              ),getImage("up.png", height: 16.sp, width: 16.sp)
            ],
          ),
          if(index != energyBenefitsDataList.length-1)
          Container(
            padding: EdgeInsets.fromLTRB(0, 12.sp, 0, 0),
            width: double.infinity,
            child: getDashedLine(color: AppColors.borderGrey,
            ),
          )
        ],
      ),
    );
  }
}

