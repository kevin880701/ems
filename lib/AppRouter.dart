/// 要Routing的頁面class上方加入 @RoutePage()
/// 先在Terminal中: flutter packages pub run build_runner build
/// 然後再AppRouter裡面加入新的CustomRoute

import 'package:auto_route/auto_route.dart';
import 'package:ems_app/repository/AccountRepository.dart';
import 'package:ems_app/screen/notification/NotificationPage.dart';
import 'package:ems_app/screen/personal/NotificationSettingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AppRouter.gr.dart';
import 'main.dart';

void goLogin(BuildContext context) {
  //跳到登入畫面同時清掉所有其他畫面
  AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_) {
    AccountRepository.instance.logout();
    return false;
  });
}

void goMain(BuildContext context) {
  //跳到主畫面同時清掉所有其他畫面
  AutoRouter.of(context).pushAndPopUntil(const MainRoute(), predicate: (_) => false);
}

Future<void> launchOther(Uri url) async {
  // final Uri phoneCallUri = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('cant launch this url');
  }
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final int rinterval = 100;

  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/launchScreen',
          page: LaunchScreenRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
          initial: true,
        ),
        CustomRoute(
          path: '/login',
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/forgotPassword',
          page: ForgotPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/changePassword',
          page: ChangePasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/main',
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/accountManager',
          page: AccountManagerRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/passwordLogin',
          page: PasswordLoginRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/systemSetting',
          page: SystemSettingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/privacyPolicy',
          page: PrivacyPolicyRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/notificationSetting',
          page: NotificationSettingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/privacySetting',
          page: PrivacySettingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/registerDeviceQr',
          page: RegisterDeviceQrRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/enterUserName',
          page: EnterUserNameRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/bindEnergyStorage',
          page: BindEnergyStorageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/scanUidQr',
          page: ScanUidQrRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/completeBinding',
          page: CompleteBindingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/registerAccount',
          page: RegisterAccountRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
        CustomRoute(
          path: '/registerPassword',
          page: RegisterPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: rinterval,
          reverseDurationInMilliseconds: rinterval,
        ),
      ];
}
