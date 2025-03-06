
import 'package:ems_app/data/fakeData/FakeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../repository/AccountRepository.dart';
import '../repository/EnergyStorageRepository.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/sharedPreferences/SharedPreferencesManager.dart';

class AccountViewModel extends ChangeNotifier {
  AccountViewModel._();

  static final AccountViewModel instance = AccountViewModel._();

  final AccountRepository accountRepository = AccountRepository.instance;

  final EnergyStorageRepository energyStorageRepository = EnergyStorageRepository.instance;

  final SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager.instance;

  String _packageInfoVersion = '';

  // 版本號
  String get packageInfoVersion => _packageInfoVersion;

  set packageInfoVersion(String value) {
    _packageInfoVersion = value;
  }

  bool isFirstLogin = true;

  FocusNode orgFocusNode = FocusNode();

  FocusNode registerAccountFocusNode = FocusNode();

  FocusNode accountFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Future<bool> login(String account, String password) async {
    var isSuccess = await accountRepository.login(account, password);
    if (isSuccess) {
      return await accountRepository.getUserInfo().then((value) {
        accountRepository.pushInfoSet();
        return isSuccess;
      });
    }
    return false;
  }

  Future<bool> getUserInfo() async {
    return accountRepository.getUserInfo();
  }

  Future<bool> getGroupId() async {
    return await accountRepository.getGroupId();
  }

  Future<int> googleSignIn() async {
    if(!(await SharedPreferencesManager.instance.getIsFakerData())){
      var userCredential = await accountRepository.googleSignIn();
      if (userCredential != null) {
        var isFirstLogin = await accountRepository.googleCheck(userCredential!.user!.uid);
        var isSuccessLogin = await accountRepository.googleLogin(userCredential);
        if (isSuccessLogin) {
          await getUserInfo().then((value) async {
            await accountRepository.pushInfoSet();
            if (!isFirstLogin && (userCredential!.user!.photoURL != null)) {
              await uploadAvatar(await getImageFileFromUrl(userCredential!.user!.photoURL!));
            }
          });
          return (isFirstLogin) ? 0 : 1;
        } else {
          return 2;
        }
      }
      return 2;
    }else{
      accountRepository.token = googleLoginToken;
      accountRepository.userInfo = googleUserInfoResponse.data;
      return 0;
    }
  }

  Future<int> appleIDSignIn() async {
    var userCredential = await accountRepository.appleIDUserLogin();
    if (userCredential != null) {
      var isFirstLogin = await accountRepository.appleCheck(userCredential!.user!.uid);
      var isSuccessLogin = await accountRepository.appleLogin(userCredential);
      if (isSuccessLogin) {
        await getUserInfo().then((value) {
          accountRepository.pushInfoSet();
        });
        return (isFirstLogin) ? 0 : 1;
      } else {
        return 2;
      }
    }
    return 2;
  }

  Future<bool> deleteUser() async {
    var isDelete = await accountRepository.deleteUser();
    if (isDelete != null) {
      return isDelete;
    } else {
      return false;
    }
  }

  Future<bool> faceIDSignIn() async {
    var isSigningIn = await accountRepository.appleFaceIDLogin();
    return isSigningIn;
  }

  Future<bool> changeUserName(String name) async {
    var isSuccess = await accountRepository.changeUserName(name);
    if (isSuccess) {
      getUserInfo().then((value) {
        notifyListeners();
      });
    }
    return isSuccess;
  }

  Future<bool> setUser(String setUserRequest) async {
    return await accountRepository.setUser(setUserRequest);
  }

  Future<bool> userNew() async {
    return await accountRepository.userNew();
  }

  Future<bool> uploadAvatar(File file) async {
    var isSuccess = await accountRepository.uploadAvatar(file);
    if (isSuccess) {
      getUserInfo().then((value) {
        notifyListeners();
      });
    }
    return isSuccess;
  }

  Future<bool> removeAvatar() async {
    var isSuccess = await accountRepository.setAvatar("");
    notifyListeners();
    return isSuccess;
  }

  Future<bool> setAvatar(String avatar) async {
    var isSuccess = await accountRepository.setAvatar(avatar);
    if (isSuccess) {
      getUserInfo();
      notifyListeners();
    }
    return isSuccess;
  }

  Future<File> getImageFileFromUrl(String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));

    final bytes = response.bodyBytes;

    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/temp_image.jpg';
    final file = File(tempPath);
    await file.writeAsBytes(bytes);

    return file;
  }

  Future<bool> autoLogin() async {
    // 檢查 SharedPreferences 中的 token
    return sharedPreferencesManager.getToken().then((String? token) {
      // 如果 token 不為空，自動登入
      if (token != null && token.isNotEmpty) {
        accountRepository.token = token;
        return accountRepository.getUserInfo().then((isSuccess) {
          accountRepository.pushInfoSet();

          return isSuccess;
        });
      } else {
        // 如果 token 為空，不自動登入
        return false;
      }
    });
  }
}
