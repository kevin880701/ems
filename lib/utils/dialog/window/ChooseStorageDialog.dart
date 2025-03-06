import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_texts.dart';
import '../../../viewModel/EnergyStorageViewModel.dart';
import '../widget/DialogTitleBar.dart';

class ChooseStorageDialog extends StatefulWidget {
  final EnergyStorageViewModel energyStorageViewModel;
  final void Function() uploadData;

  const ChooseStorageDialog({
    Key? key,
    required this.energyStorageViewModel,
    required this.uploadData,
  }) : super(key: key);

  @override
  _ChooseStorageDialog createState() => _ChooseStorageDialog();
}

class _ChooseStorageDialog extends State<ChooseStorageDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double listHeight = widget.energyStorageViewModel.deviceList.length * 40.sp;
    double containerHeight = listHeight > (MediaQuery.of(context).size.height * 0.8) - 48 ? (MediaQuery.of(context).size.height * 0.8) - 48  : listHeight;
    double topPadding = MediaQuery.of(context).size.height - containerHeight;

    return LayoutBuilder(builder: (context, constraints) {
      return Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.fromLTRB(0.sp, topPadding - 56.sp - 8.sp - 36, 0.sp, 0.sp),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              DialogTitleBar(
                title: AppTexts.chooseStorage,
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
              SizedBox(
                height: 8.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                height: containerHeight ,
                color: AppColors.white,
                child: Container(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: widget.energyStorageViewModel.deviceList.length,
                    separatorBuilder: (BuildContext context, int index) => Divider(
                      color: AppColors.borderGrey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          widget.energyStorageViewModel.deviceListIndex = index;
                          widget.energyStorageViewModel.deviceId = widget.energyStorageViewModel.deviceList[index].devId;
                          widget.uploadData();
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 4.sp,
                                ),
                                Container(
                                    width: 240.sp,
                                    child: getText(
                                    widget.energyStorageViewModel.deviceList[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: AppColors.primaryBlack,
                                    maxLines: 1)),
                                Spacer(),
                                widget.energyStorageViewModel.deviceListIndex == index ?
                                getImage(
                                  "choose.png",
                                  height: 24.sp,
                                  width: 24.sp,
                                ):SizedBox()
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
