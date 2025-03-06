import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';

class MyQrCodeDialog extends StatefulWidget {
  const MyQrCodeDialog({super.key, required this.uid});

  final String uid;

  @override
  _MyQrCodeDialog createState() => _MyQrCodeDialog();
}

class _MyQrCodeDialog extends State<MyQrCodeDialog> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 0.0,
          bottomOpacity: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
      color: AppColors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.sp, 8.sp, 12.sp, 8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 28.sp,
                ),
                getText(AppTexts.myQrCode, fontSize: 18.sp, color: AppColors.primaryBlack),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();},
                  child: getImageIcon("cancel2.png", width: 28.sp, height: 28.sp, color: AppColors.lightBlue),
                )
              ],
            ),
          ),
          Container(
            height: 1.sp,
            color: AppColors.borderGrey,
          ),
          SizedBox(height: 48.sp,),
          QrImageView(
            data: widget.uid,
            version: QrVersions.auto,
            size: 280.sp,
            gapless: false,
            embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
          ),
          SizedBox(height: 24.sp,),
          getText(AppTexts.provideQrCode,fontSize: 16.sp,color: AppColors.grey,fontWeight: FontWeight.w400)
        ],
      ),
    )));
  }
}
