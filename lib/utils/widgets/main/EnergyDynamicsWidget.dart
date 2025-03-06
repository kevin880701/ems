import 'dart:io';

import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EnergyDynamicsWidget extends StatefulWidget {
  final String baseUrl;
  final String devid;
  final String token;

  EnergyDynamicsWidget({required this.baseUrl, required this.devid, required this.token});

  @override
  _EnergyDynamicsWidgetState createState() => _EnergyDynamicsWidgetState();
}

class _EnergyDynamicsWidgetState extends State<EnergyDynamicsWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(Platform.isIOS?true:false);
  }

  @override
  Widget build(BuildContext context) {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String url =
        "${widget.baseUrl}/web/NewEnergyStorage/ihouseESS/Energy_storage_info/EnergyFlowMap/FlowMap.html?token=${widget.token}&devid=${widget.devid}&T=$timestamp";

    _controller.loadRequest(Uri.parse(url));

    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(
            "流動圖",
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlack,
            textAlign: TextAlign.start,
          ),
      AspectRatio(
        aspectRatio: 1,
        child: WebViewWidget(controller: _controller),
      ),
        ],
      ),
    );
  }
}
