import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/repository/AccountRepository.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../AppRouter.dart';
import '../../data/DeviceQrData.dart';
import '../../utils/dialog/DialogManager.dart';
import '../../utils/dialog/window/MyQrCodeDialog.dart';
import '../../utils/widgets/scan/ScannerOverlay.dart';
import '../../utils/widgets/scan/scanner_error_widget.dart';
import '../../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class RegisterDeviceQrPage extends StatefulWidget {
  const RegisterDeviceQrPage({
    super.key,
    this.isFirstUse = false,
  });

  final bool isFirstUse;

  @override
  State<RegisterDeviceQrPage> createState() => _RegisterDeviceQrPageState();
}

class _RegisterDeviceQrPageState extends BasePageState<RegisterDeviceQrPage> {
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  AccountRepository accountRepository = AccountRepository.instance;
  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    torchEnabled: false,
    formats: [BarcodeFormat.qrCode],
    facing: CameraFacing.back,
  );
  DateTime? lastScan;
  double statusBarHeight = 0;

  @override
  void initState() {
    super.initState();
    cameraController.start();
    cameraController.barcodes.listen((barcodeScanResult) {
      final currentScan = DateTime.now();
      if (lastScan == null || currentScan.difference(lastScan!) > const Duration(seconds: 3)) {
        lastScan = currentScan;
        setState(() {
          String decodedString = Uri.decodeComponent(barcodeScanResult.barcodes.first.rawValue ?? "null");
          print("_scannedCode：${decodedString}");
          if (DeviceQrData.isValidFormat(decodedString)) {
            EasyLoading.show();
            print('註冊設備QR格式正確');
            // 解析字元串並使用DeviceQrData對象進行進一步操作
            DeviceQrData deviceQrData = DeviceQrData.fromJson(jsonDecode(decodedString));
            print('Device ID: ${deviceQrData.devInfo.name}');
            print('Groups: ${deviceQrData.groups}');
            energyStorageViewModel.registerDevice(deviceQrData).then((value) {
              Future.delayed(const Duration(seconds: 2), () {
                if (value) {
                  if (widget.isFirstUse) {
                    AutoRouter.of(context).pushNamed("/completeBinding");
                  } else {
                    goMain(context);
                  }
                  cameraController.dispose();
                  EasyLoading.dismiss();
                } else if (value == false){
                  showToast(
                      context: context,
                      text: AppTexts.invalidBarcode,
                      backgroundColor: AppColors.red,
                      textColor: AppColors.white);
                  EasyLoading.dismiss();
                }
              });
            });
          } else {
            showToast(
                context: context,
                text: AppTexts.invalidBarcode,
                backgroundColor: AppColors.red,
                textColor: AppColors.white);
            EasyLoading.dismiss();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    print("cameraController.dispose();");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight =  MediaQuery.of(context).padding.top;
    final scanWindowWidth = MediaQuery.of(context).size.width * 0.75;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: scanWindowWidth,
      height: scanWindowWidth,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0.0,
        bottomOpacity: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
              child: Column(children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: MobileScanner(
                  controller: cameraController,
                  scanWindow: scanWindow,
                  errorBuilder: (context, error, child) {
                    return ScannerErrorWidget(error: error);
                  },
                  overlayBuilder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: ScannerOverlay(scanWindow: scanWindow),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(12.sp, statusBarHeight, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: getImageIcon("back.png", width: 24.sp, height: 24.sp, color: AppColors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDefaultDialog(
                            context,
                            MyQrCodeDialog(
                              uid: accountRepository.userInfo.uid ?? "",
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 24.sp),
                        alignment: Alignment.center,
                        height: 48.sp,
                        width: 280.sp,
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: getText(AppTexts.showMyQrCode, fontSize: 16.sp, color: AppColors.lightBlue),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}

