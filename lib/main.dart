
import 'dart:async';

import 'package:ems_app/define.dart';
import 'package:ems_app/viewModel/EnergyModeViewModel.dart';
import 'package:ems_app/viewModel/EnergyStorageViewModel.dart';
import 'package:ems_app/viewModel/NotificationViewModel.dart';
import 'package:ems_app/viewModel/AccountViewModel.dart';
import 'package:ems_app/viewModel/SettingViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'AppRouter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

BuildContext? get appContext => navigatorKey.currentContext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  //
  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //   }
  // });
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter(navigatorKey: navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountViewModel.instance),
        ChangeNotifierProvider(
            create: (context) => EnergyStorageViewModel.instance),
        ChangeNotifierProvider(
            create: (context) => NotificationViewModel.instance),
        ChangeNotifierProvider(
            create: (context) => EnergyModeViewModel.instance),
        ChangeNotifierProvider(create: (context) => SettingViewModel.instance),
      ],
      child: ScreenUtilInit(
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color(0xFFF5F5F5),
              scaffoldBackgroundColor: const Color(0xFFF5F5F5),
              textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
            ),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0),devicePixelRatio: 1.0),
                child: EasyLoading.init()(context, child),
              );
            },
          );
        },
      ),
    );
  }
}
