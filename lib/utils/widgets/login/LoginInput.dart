
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../resources/app_colors.dart';

Widget loginInput(
  String title, {
  String? initValue,
  FocusNode? focusNode,
  Function(String?)? onChanged,
      Function(String?)? onSaved,
      Function()? onEditingComplete,
  String? Function(String?)? validator,
  keyboardType = TextInputType.phone,
  double paddingTop = 0,
  String? hintText,
  bool obscureText = false,
  bool readOnly = false,
      List<TextInputFormatter>? inputFormatters,
      TextEditingController? textEditingController,
}) {

  var border = OutlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: AppColors.white),
    borderRadius: BorderRadius.circular(8.r),
  );
  var focuseBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: AppColors.appPrimaryBlue),
    borderRadius: BorderRadius.circular(8.r),
  );
  var errBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: AppColors.red),
    borderRadius: BorderRadius.circular(8.r),
  );

  return Column(
    children: [
      Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(28.w, paddingTop, 0, 0),
          child: Container(
              height: 26.h,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: getText(title, fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ))),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
        child: TextFormField(
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          cursorColor: AppColors.lightBlue,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          onEditingComplete: onEditingComplete,
          controller:
              (textEditingController != null) ? textEditingController : null,
          readOnly: readOnly,
          style: TextStyle(
            color: AppColors.appPrimaryBlack,
            fontSize: 16.sp,
            fontFamily: 'PingFang TC',
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.fromLTRB(8.w, 16.h, 24.w, 16.h),
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: focuseBorder,
              enabledBorder: border,
              errorBorder: errBorder,
              focusedErrorBorder: border,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.grey)),
        ),
      ),
    ],
  );
}
