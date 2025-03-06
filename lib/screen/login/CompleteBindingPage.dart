
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/AppRouter.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/resources/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../utils/widgets/login/BottomButton.dart';
import '../../viewModel/EnergyStorageViewModel.dart';

@RoutePage()
class CompleteBindingPage extends StatefulWidget {
  const CompleteBindingPage({super.key});

  @override
  State<CompleteBindingPage> createState() => _CompleteBindingPageState();
}

class _CompleteBindingPageState extends BasePageState<CompleteBindingPage> {
  EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(children:[
        Expanded(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 120.sp,
              ),
              getImage("success.png", width: 72.sp, height: 72.sp),
              SizedBox(
                height: 16.sp,
              ),
              getText(AppTexts.completeBindingEnergyStorage, fontSize: 16.sp, color: AppColors.primaryBlack),
              Spacer(),
              bottomButton(context, AppTexts.startUsing, AppColors.primaryBlack,
                  edge: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 16.h), onTap: () {
                    AutoRouter.of(context).pushNamed("/main");
                  })
            ]),
          ),
        )],),
      ),
    );
  }
}
