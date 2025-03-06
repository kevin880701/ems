
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../define.dart';
import '../../../resources/app_colors.dart';

Widget passwordInput(
  String title, {
  Function()? suffixIconTap,
  bool isPasswordVisible = false,
  String? initValue,
  FocusNode? focusNode,
  Function(String?)? onChanged,
  Function(String?)? onSaved,
  String? Function(String?)? validator,
  keyboardType = TextInputType.text,
  double paddingTop = 0,
  String? hintText,
  bool readOnly = false,
  bool useController = true,
  TextEditingController? textEditingController,
}) {
  var border = OutlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: AppColors.borderGrey),
    borderRadius: BorderRadius.circular(8.r),
  );
  var focuseBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: AppColors.primaryBlue),
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
                      padding: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                      child:
                          getText(title, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                ],
              ))),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#\$%^&*()-_+=<>?/\|{}[\]~]')),
          ],
          focusNode: focusNode,
          cursorColor: AppColors.lightBlue,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          controller: (textEditingController != null) ? textEditingController : null,
          readOnly: readOnly,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: 16.sp,
            fontFamily: 'PingFang TC',
            fontWeight: FontWeight.w400,
          ),
          obscureText: !isPasswordVisible,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.fromLTRB(8.w, 16.h, 24.w, 16.h),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                icon: isPasswordVisible?getImageIcon("show_password.png",width: 24.sp,color: AppColors.grey):getImageIcon("hide_password.png",width: 24.sp,color: AppColors.grey),
                onPressed: suffixIconTap,
              ),
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: focuseBorder,
              enabledBorder: border,
              errorBorder: errBorder,
              focusedErrorBorder: errBorder,
              border: InputBorder.none,
              hintText: hintText,
              errorStyle: TextStyle(fontSize: 14.sp,fontFamily: 'PingFang TC',
                  fontWeight: FontWeight.w400,color: AppColors.red),
              hintStyle: TextStyle(fontSize: 14.sp,fontFamily: 'PingFang TC',
                  fontWeight: FontWeight.w400,color: AppColors.grey)),

        ),
      ),
    ],
  );
}
