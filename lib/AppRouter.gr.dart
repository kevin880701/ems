// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:ems_app/screen/energyStorage/EnergyStoragePage.dart' as _i5;
import 'package:ems_app/screen/energyStorage/ScanUidQrPage.dart' as _i18;
import 'package:ems_app/screen/LaunchScreenPage.dart' as _i8;
import 'package:ems_app/screen/login/BindEnergyStoragePage.dart' as _i2;
import 'package:ems_app/screen/login/ChangePasswordPage.dart' as _i3;
import 'package:ems_app/screen/login/CompleteBindingPage.dart' as _i4;
import 'package:ems_app/screen/login/EnterUserNamePage.dart' as _i6;
import 'package:ems_app/screen/login/ForgotPasswordPage.dart' as _i7;
import 'package:ems_app/screen/login/PasswordLoginPage.dart' as _i12;
import 'package:ems_app/screen/login/RegisterAccountPage.dart' as _i15;
import 'package:ems_app/screen/login/RegisterDeviceQrPage.dart' as _i16;
import 'package:ems_app/screen/login/RegisterPasswordPage.dart' as _i17;
import 'package:ems_app/screen/LoginPage.dart' as _i9;
import 'package:ems_app/screen/MainPage.dart' as _i10;
import 'package:ems_app/screen/personal/AccountManagerPage.dart' as _i1;
import 'package:ems_app/screen/personal/NotificationSettingPage.dart' as _i11;
import 'package:ems_app/screen/personal/PrivacyPolicyPage.dart' as _i13;
import 'package:ems_app/screen/personal/PrivacySettingPage.dart' as _i14;
import 'package:ems_app/screen/personal/SystemSettingPage.dart' as _i19;
import 'package:ems_app/screen/TestPage.dart' as _i20;
import 'package:flutter/cupertino.dart' as _i22;

/// generated route for
/// [_i1.AccountManagerPage]
class AccountManagerRoute extends _i21.PageRouteInfo<void> {
  const AccountManagerRoute({List<_i21.PageRouteInfo>? children})
      : super(
          AccountManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountManagerRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountManagerPage();
    },
  );
}

/// generated route for
/// [_i2.BindEnergyStoragePage]
class BindEnergyStorageRoute extends _i21.PageRouteInfo<void> {
  const BindEnergyStorageRoute({List<_i21.PageRouteInfo>? children})
      : super(
          BindEnergyStorageRoute.name,
          initialChildren: children,
        );

  static const String name = 'BindEnergyStorageRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i2.BindEnergyStoragePage();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordPage]
class ChangePasswordRoute extends _i21.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i4.CompleteBindingPage]
class CompleteBindingRoute extends _i21.PageRouteInfo<void> {
  const CompleteBindingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          CompleteBindingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteBindingRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i4.CompleteBindingPage();
    },
  );
}

/// generated route for
/// [_i5.EnergyStoragePage]
class EnergyStorageRoute extends _i21.PageRouteInfo<EnergyStorageRouteArgs> {
  EnergyStorageRoute({
    _i22.Key? key,
    _i22.Brightness? statusBarIconColor = _i22.Brightness.light,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EnergyStorageRoute.name,
          args: EnergyStorageRouteArgs(
            key: key,
            statusBarIconColor: statusBarIconColor,
          ),
          initialChildren: children,
        );

  static const String name = 'EnergyStorageRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EnergyStorageRouteArgs>(
          orElse: () => const EnergyStorageRouteArgs());
      return _i5.EnergyStoragePage(
        key: args.key,
        statusBarIconColor: args.statusBarIconColor,
      );
    },
  );
}

class EnergyStorageRouteArgs {
  const EnergyStorageRouteArgs({
    this.key,
    this.statusBarIconColor = _i22.Brightness.light,
  });

  final _i22.Key? key;

  final _i22.Brightness? statusBarIconColor;

  @override
  String toString() {
    return 'EnergyStorageRouteArgs{key: $key, statusBarIconColor: $statusBarIconColor}';
  }
}

/// generated route for
/// [_i6.EnterUserNamePage]
class EnterUserNameRoute extends _i21.PageRouteInfo<void> {
  const EnterUserNameRoute({List<_i21.PageRouteInfo>? children})
      : super(
          EnterUserNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterUserNameRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i6.EnterUserNamePage();
    },
  );
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i21.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i7.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i8.LaunchScreenPage]
class LaunchScreenRoute extends _i21.PageRouteInfo<void> {
  const LaunchScreenRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LaunchScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchScreenRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i8.LaunchScreenPage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginPage();
    },
  );
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i21.PageRouteInfo<void> {
  const MainRoute({List<_i21.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i10.MainPage();
    },
  );
}

/// generated route for
/// [_i11.NotificationSettingPage]
class NotificationSettingRoute extends _i21.PageRouteInfo<void> {
  const NotificationSettingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          NotificationSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSettingRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i11.NotificationSettingPage();
    },
  );
}

/// generated route for
/// [_i12.PasswordLoginPage]
class PasswordLoginRoute extends _i21.PageRouteInfo<void> {
  const PasswordLoginRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PasswordLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordLoginRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i12.PasswordLoginPage();
    },
  );
}

/// generated route for
/// [_i13.PrivacyPolicyPage]
class PrivacyPolicyRoute extends _i21.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i13.PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [_i14.PrivacySettingPage]
class PrivacySettingRoute extends _i21.PageRouteInfo<void> {
  const PrivacySettingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PrivacySettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacySettingRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i14.PrivacySettingPage();
    },
  );
}

/// generated route for
/// [_i15.RegisterAccountPage]
class RegisterAccountRoute extends _i21.PageRouteInfo<void> {
  const RegisterAccountRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RegisterAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterAccountRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i15.RegisterAccountPage();
    },
  );
}

/// generated route for
/// [_i16.RegisterDeviceQrPage]
class RegisterDeviceQrRoute
    extends _i21.PageRouteInfo<RegisterDeviceQrRouteArgs> {
  RegisterDeviceQrRoute({
    _i22.Key? key,
    bool isFirstUse = false,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          RegisterDeviceQrRoute.name,
          args: RegisterDeviceQrRouteArgs(
            key: key,
            isFirstUse: isFirstUse,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterDeviceQrRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterDeviceQrRouteArgs>(
          orElse: () => const RegisterDeviceQrRouteArgs());
      return _i16.RegisterDeviceQrPage(
        key: args.key,
        isFirstUse: args.isFirstUse,
      );
    },
  );
}

class RegisterDeviceQrRouteArgs {
  const RegisterDeviceQrRouteArgs({
    this.key,
    this.isFirstUse = false,
  });

  final _i22.Key? key;

  final bool isFirstUse;

  @override
  String toString() {
    return 'RegisterDeviceQrRouteArgs{key: $key, isFirstUse: $isFirstUse}';
  }
}

/// generated route for
/// [_i17.RegisterPasswordPage]
class RegisterPasswordRoute extends _i21.PageRouteInfo<void> {
  const RegisterPasswordRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RegisterPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPasswordRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i17.RegisterPasswordPage();
    },
  );
}

/// generated route for
/// [_i18.ScanUidQrPage]
class ScanUidQrRoute extends _i21.PageRouteInfo<ScanUidQrRouteArgs> {
  ScanUidQrRoute({
    _i22.Key? key,
    required String devId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ScanUidQrRoute.name,
          args: ScanUidQrRouteArgs(
            key: key,
            devId: devId,
          ),
          initialChildren: children,
        );

  static const String name = 'ScanUidQrRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScanUidQrRouteArgs>();
      return _i18.ScanUidQrPage(
        key: args.key,
        devId: args.devId,
      );
    },
  );
}

class ScanUidQrRouteArgs {
  const ScanUidQrRouteArgs({
    this.key,
    required this.devId,
  });

  final _i22.Key? key;

  final String devId;

  @override
  String toString() {
    return 'ScanUidQrRouteArgs{key: $key, devId: $devId}';
  }
}

/// generated route for
/// [_i19.SystemSettingPage]
class SystemSettingRoute extends _i21.PageRouteInfo<void> {
  const SystemSettingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SystemSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SystemSettingRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i19.SystemSettingPage();
    },
  );
}

/// generated route for
/// [_i20.TestPage]
class TestRoute extends _i21.PageRouteInfo<void> {
  const TestRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i20.TestPage();
    },
  );
}
