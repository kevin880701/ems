import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/screen/personal/PersonalPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../repository/AccountRepository.dart';
import '../resources/app_colors.dart';
import '../resources/app_texts.dart';
import '../utils/sharedPreferences/SharedPreferencesManager.dart';
import '../viewModel/AccountViewModel.dart';
import '../viewModel/EnergyModeViewModel.dart';
import '../viewModel/EnergyStorageViewModel.dart';
import 'energyStorage/EnergyStoragePage.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage> with TickerProviderStateMixin {
  final EnergyStorageViewModel energyStorageViewModel = EnergyStorageViewModel.instance;
  final EnergyModeViewModel energyModeViewModel = EnergyModeViewModel.instance;
  final SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager.instance;
  final AccountRepository accountRepository = AccountRepository.instance;
  var accountViewModel = AccountViewModel.instance;
  late final TabController _tabController;
  int tabSelectedIndex = 0; // Tab索引
  int tabQuantity = 2; // Tab數量

  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();
    _tabController = TabController(length: tabQuantity, vsync: this);
    if (accountRepository.token != null && accountRepository.token.isNotEmpty) {
      sharedPreferencesManager.saveToken(accountRepository.token);
    }
    initialMainPageInfo();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
            physics: NeverScrollableScrollPhysics(), // 禁用滑動
            controller: _tabController,
            children: const <Widget>[
              EnergyStoragePage(),
              // NotificationPage(),  // 本次驗收不需要，先註解
              PersonalPage(),
            ],
          )),
          Container(
            color: AppColors.primaryBlack,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.transparent,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.grey,
              dividerColor: AppColors.primaryBlack,
              tabs: <Widget>[
                Tab(
                  icon: tabSelectedIndex == 0
                      ? getImageIcon('energy_storage_click.png', width: 24.sp, height: 24.sp, color: AppColors.white)
                      : getImageIcon('energy_storage.png', width: 24.sp, height: 24.sp, color: AppColors.grey),
                  text: AppTexts.energyStorage,
                ),
                // Tab(  // 本次驗收不需要，先註解
                //   icon: tabSelectedIndex == 1
                //       ? getImageIcon('notifications_click.png', width: 24.sp, height: 24.sp, color: AppColors.white)
                //       : getImageIcon('notifications.png', width: 24.sp, height: 24.sp, color: AppColors.grey),
                //   text: AppTexts.notification,
                // ),
                Tab(
                  icon: tabSelectedIndex == 1
                      ? getImageIcon('personal_click.png', width: 24.sp, height: 24.sp, color: AppColors.white)
                      : getImageIcon('personal.png', width: 24.sp, height: 24.sp, color: AppColors.grey),
                  text: AppTexts.personal,
                ),
              ],
              onTap: (index) {
                setState(() {
                  tabSelectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void initialMainPageInfo() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    accountRepository.firebaseMessagingToken = await FirebaseMessaging.instance.getToken() ?? "";

    print("fcm token: ${await FirebaseMessaging.instance.getToken()}");
    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.title}');
      }
    });
  }
}
