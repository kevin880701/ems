
import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../../../viewModel/AccountViewModel.dart';
import 'dart:io';

class EditPictureDialog extends StatefulWidget {
  const EditPictureDialog({
    super.key,
  });

  @override
  _EditPictureDialog createState() => _EditPictureDialog();
}

class _EditPictureDialog extends State<EditPictureDialog> {
  var accountViewModel = AccountViewModel.instance;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 48.sp),
      child: Container(
        padding: EdgeInsets.fromLTRB(24.sp, 20.sp, 24.sp, 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getText(AppTexts.editPicture, fontSize: 16.sp),
              SizedBox(
                height: 16.sp,
              ),
              itemWidget(AppTexts.removeCurrentlyPicture, () {
                 accountViewModel.removeAvatar().then((value){
                   Navigator.of(context).pop();
                 });
              }),
              itemWidget(AppTexts.takePicture, () {_openCamera(context);}),
              itemWidget(AppTexts.selectFromPhotoGallery, () {_pickImageFromGallery(context);}),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  },
                child: Container(
                  margin: EdgeInsets.only(top: 8.sp),
                  alignment: Alignment.centerLeft,
                  child: getText(AppTexts.cancel, fontWeight: FontWeight.w400, fontSize: 16.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemWidget(String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 4.sp, 0, 4.sp),
        child: Row(
          children: [
            getText(text, fontWeight: FontWeight.w400, fontSize: 16.sp),
            Spacer(),
            getImageIcon("arrow_right.png", height: 16.sp, width: 16.sp, color: AppColors.lightBlue)
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print('Image selected: ${pickedImage.path}');
      accountViewModel.uploadAvatar(File(pickedImage.path)).then((value){
        Navigator.of(context).pop();
      });
    } else {
      print('No image selected');
    }
  }

  Future<void> _openCamera(BuildContext context) async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      accountViewModel.uploadAvatar(File(image.path)).then((value){
        Navigator.of(context).pop();
      });
    }
  }
}
