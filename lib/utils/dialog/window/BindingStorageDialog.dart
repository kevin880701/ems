import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../AppRouter.dart';
import '../../../screen/login/RegisterDeviceQrPage.dart';
import '../widget/DialogTitleBar.dart';

class BindingStorageDialog extends StatefulWidget {
  const BindingStorageDialog({
    super.key,
  });


  @override
  _DefaultDialog createState() => _DefaultDialog();
}

class _DefaultDialog extends State<BindingStorageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 48.sp),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.sp, 20.sp, 16.sp, 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DialogTitleBar(
                title: AppTexts.unboundEnergyStorage,
              ),
              SizedBox(
                height: 4.sp,
              ),
              getText(AppTexts.unboundEnergyStorageDescription, fontWeight: FontWeight.w400, fontSize: 14.sp),
              SizedBox(
                height: 16.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      goLogin(context);
                    },
                    child: getText(AppTexts.loginAgain, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const RegisterDeviceQrPage(
                            isFirstUse: true,
                          ),
                        ),
                      );
                    },
                    child: getText(AppTexts.bindNow, fontSize: 16.sp, color: AppColors.lightBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
