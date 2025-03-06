import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../AppRouter.dart';
import '../../widgets/datePicker/library/date_picker.dart';
import '../../widgets/datePicker/library/date_picker_manager.dart';
import '../widget/DialogTitleBar.dart';

class RegisterAccountDialog extends StatefulWidget {
  const RegisterAccountDialog({
    super.key,
  });

  @override
  _RegisterAccountDialog createState() => _RegisterAccountDialog();
}

class _RegisterAccountDialog extends State<RegisterAccountDialog> {
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
                title: "註冊帳號",
              ),
              SizedBox(
                height: 4.sp,
              ),
              getText("請聯繫客服協助註冊帳號", fontWeight: FontWeight.w400, fontSize: 14.sp),
              SizedBox(
                height: 16.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: getText(AppTexts.cancel, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      final Uri url = Uri(scheme: 'tel',path: AppTexts.phoneNumber);
                      launchOther(url);
                    },
                    child: getText(AppTexts.call, fontSize: 16.sp, color: AppColors.lightBlue),
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
