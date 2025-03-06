import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../AppRouter.dart';
import '../../utils/widgets/login/BottomButton.dart';
import 'RegisterDeviceQrPage.dart';

@RoutePage()
class BindEnergyStoragePage extends StatefulWidget {
  const BindEnergyStoragePage({super.key});

  @override
  State<BindEnergyStoragePage> createState() => _BindEnergyStoragePageState();
}

class _BindEnergyStoragePageState extends BasePageState<BindEnergyStoragePage> {
  TextEditingController _controller = TextEditingController();
  Color _color = AppColors.disableGrey;
  late void Function()? onTapHandler;
  String name = "";

  @override
  void initState() {
    super.initState();
    updateColor();
  }

  @override
  void dispose() {
    // 清理控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 72.sp,
          ),
          getImage("bind_energy_storage.png", height: 72.sp, width: 72.sp),
          SizedBox(
            height: 16.sp,
          ),
          getText(AppTexts.unboundEnergyStorage, fontSize: 16.sp, color: AppColors.grey),
          SizedBox(
            height: 16.sp,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterDeviceQrPage(
                    isFirstUse: true,
                  ),
                ),
              );},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getText(AppTexts.goBinding, fontSize: 16.sp, color: AppColors.lightBlue),
                getImageIcon("arrow_right.png", width: 16.sp, height: 16.sp)
              ],
            ),
          ),
          Spacer(),
          bottomButton(context, AppTexts.loginAgain, AppColors.primaryBlack,
              edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: () {
            goLogin(context);
          }),
        ],
      ),
    ));
  }

  void updateColor() {
    if (name.isNotEmpty) {
      setState(() {
        _color = AppColors.appPrimaryBlack;
        onTapHandler = () async {
          // EasyLoading.show();
          // await accountViewModel.login(0).then((value) {
          //   if (value) {
          //     goMain(context);
          //   } else {
          //     showToast(
          //         context: context,
          //         text: AppTexts.wrongPassword,
          //         backgroundColor: AppColors.red,
          //         textColor: AppColors.white);
          //   }
          // });
        };
      });
    } else {
      setState(() {
        _color = AppColors.disableGrey;
        onTapHandler = null;
      });
    }
  }
}
