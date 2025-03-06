import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/widgets/main/TitleBar2.dart';

@RoutePage()
class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends BasePageState<PrivacyPolicyPage> {
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setBackgroundColor(AppColors.bgColor)
      ..loadFlutterAsset('assets/other/privacy.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Column(children: [
            TitleBar2(
              title: AppTexts.privacyPolicy,
              leftWidget: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: getImageIcon("back.png",
                      height: 28.sp,
                      width: 28.sp,
                      color: AppColors.appPrimaryBlack)),
              rightWidget: SizedBox(),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(24.sp),
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height), // 添加最大高度约束
                  child: WebViewWidget(controller: _controller),
                ),

            )


          ])),
    );
  }
}
