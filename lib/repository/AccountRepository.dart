import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:ems_app/data/apiRequest/appleLogin/AppleLoginBody.dart';
import 'package:ems_app/data/apiRequest/deleteUser/DeleteUserParams.dart';
import 'package:ems_app/data/apiRequest/googleLogin/GoogleLoginBody.dart';
import 'package:ems_app/data/apiRequest/uploadAvatar/UploadAvatarBody.dart';
import 'package:ems_app/data/apiResponse/login/LoginResponse.dart';
import 'package:ems_app/data/apiResponse/userDetailInfo/UserDetailInfoResponse.dart';
import 'package:ems_app/data/apiResponse/userInfo/UserInfoResponse.dart';
import 'package:ems_app/net/remote/ApiEndPoint.dart';
import 'package:ems_app/net/remote/NetworkInterface.dart';
import 'package:ems_app/repository/ThirdPartySignIn/AppleSignInProvider.dart';
import 'package:ems_app/repository/ThirdPartySignIn/GoogleSignInProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../net/remote/Managers/AccountManager.dart';
import '../utils/sharedPreferences/SharedPreferencesManager.dart';

class AccountRepository {
  AccountRepository._();

  static final AccountRepository instance = AccountRepository._();

  NetworkInterface network = NetworkInterface();

  AccountManager accountManager = AccountManager.instance;

  GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  AppleSignInProvider appleSignInProvider = AppleSignInProvider();

  final SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager.instance;
  late UserDetailInfo currentUserDetailInfo;
  late UserCredential userCredential;

  String account = "";
  String password = "";

  String registerAccount = "";
  String registerPassword = "";
  String registerConfirmPassword = "";
  String? groupId;
  String token = "";
  late UserInfoData userInfo;

  String firebaseMessagingToken = "";

  void logout() {
    token = "";
    account = "";
    password = "";

    registerAccount = "";
    registerPassword = "";
    registerConfirmPassword = "";

    sharedPreferencesManager.saveToken("");

    if (userInfo != null) {
      if (userInfo.accountType == 2) {
        googleSignInProvider.logout();
      } else if (userInfo.accountType == 3) {
        appleSignInProvider.logout();
      }
    }
  }

  Future<bool> login(String account, String password) async {
    LoginResponseData? loginResponseData = await accountManager.login(account: account,password: password);
    if (loginResponseData != null) {
      token = loginResponseData.token;
      return true;
    } else {
      return false;
    }
  }

  //Google SignIn
  Future<UserCredential?> googleSignIn() async {
    if (googleSignInProvider.isSigningIn == false) {
      var userCredential = await googleSignInProvider.login();
      if (userCredential != null) {
        print("=================================");
        print(userCredential.user!.refreshToken);
        print(userCredential.user!.photoURL);
        print(userCredential.credential!.token);
        print(userCredential.credential!.accessToken);
        print("=================================");
        this.userCredential = userCredential;
        return userCredential;
      } else {
        return null;
      }
    } else {
      print('GoogleAuth is already sign in!');
      return null;
    }
  }

  Future<bool> googleLogin(UserCredential userCredential) async {
    var body = GoogleLoginBody(
        account: userCredential.user!.email ?? userCredential.user!.uid!,
        name: userCredential.user!.displayName ?? "N/A",
        gUid: userCredential.user!.uid);
    LoginResponseData? loginResponseData = await accountManager.googleLogin(body);
    if (loginResponseData != null) {
      token = loginResponseData.token;
      print('GoogleAuth is sign in!');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> appleLogin(UserCredential userCredential) async {
    final jwt = JWT.decode(userCredential.credential!.accessToken!);
    var appleLoginBody = AppleLoginBody(
        account: jwt.payload['email'] ?? userCredential.user!.uid, name: "N/A", aUid: userCredential.user!.uid);
    LoginResponseData? loginResponseData = await accountManager.appleLogin(appleLoginBody);
    if (loginResponseData != null) {
      token = loginResponseData.token;
      print('AppleAuth is sign in!');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUser() async {
    var params =
    DeleteUserParams(account: userInfo.account!, accountType: userInfo.accountType, org: userInfo.org);
    return await accountManager.delUser(params, token).then((isDelete) {
      if(isDelete == true){
        if(userInfo.accountType == 2 || userInfo.accountType == 3){
          if(FirebaseAuth.instance.currentUser != null){
            FirebaseAuth.instance.currentUser!.delete();
          }
        }
        return true;
      }else{
        return false;
      }
    });
  }

  Future<bool> getUserInfo() async {
    UserInfoData? userInfoData = await accountManager.getUserInfo(token);
    if (userInfoData != null) {
      userInfo = userInfoData;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setGroup(String setGroupRequest) async {
    return await accountManager.setGroup(token, setGroupRequest);
  }

  Future<bool> setUser(String setUserRequest) async {
    return await accountManager.setUser(token, setUserRequest);
  }

  Future<bool> getGroupId() async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.userInfo;
        return network.get(url: url, userToken: token);
      });
      if (response.statusCode == 200) {
        UserDetailInfo detailInfo = UserDetailInfo.fromJson(response.data as Map<String, dynamic>);

        currentUserDetailInfo = detailInfo;
        groupId = currentUserDetailInfo.groups
            .where((element) => currentUserDetailInfo.org == element.name)
            .map((element) => element.groupId)
            .join(', ');
        print("getGroupId()：${groupId}");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Failed to get user info: $e');
      return false;
    }
  }

  Future<UserCredential?> appleIDUserLogin() async {
    if (appleSignInProvider.isSigningIn == false) {
      return await appleSignInProvider.login();
    } else {
      print('AppleAuth is already sign in!');
      return null;
    }
  }

  Future<bool> appleFaceIDLogin() async {
    //FaceID
    return true;
  }

  Future<bool> googleCheck(String uid) async {
    try {
      final response = await accountManager.googleCheck(token, uid);
      return response;
    } catch (e, stackTrace) {
      // 打印錯誤日誌（可選）
      print('Error in googleCheck: $e');
      print('StackTrace: $stackTrace');

      // 返回預設值或錯誤標誌
      return false; // 假設錯誤時返回 false
    }
  }

  Future<bool> appleCheck(String uid) async {
    return await accountManager.appleCheck(token, uid: uid);
  }

  Future<bool> changeUserName(String name) async {
    var isSuccess =
        await accountManager.changeUserName(token, userInfo.uid ?? "", name: name);
    if (isSuccess) {
      getUserInfo();
    }
    return isSuccess;
  }

  Future<bool> userNew() async {
    var isSuccess =
        await accountManager.userNew(name: "N/A", acc: registerAccount, pwd: registerPassword,);
    return isSuccess;
  }

  Future<bool> uploadAvatar(File file) async {
    return await accountManager
        .uploadAvatar(
            token,
        UploadAvatarBody(
              file1: file,
              attrs: {"type": "avatar"},
            ))
        .then((fileId) {
      if (fileId != null) {
        setAvatar(fileId);
        return getUserInfo();
      }
      return false;
    });
  }

  Future<bool> setAvatar(String avatar) async {
    return accountManager
        .setAvatar(token, userInfo.uid ?? "", avatar: avatar,)
        .then((isSuccess) {
      if (isSuccess) {
        return getUserInfo();
      }
      return false;
    });
  }

  Future<bool> pushInfoSet() async {
    return accountManager.pushInfoSet(
        token,
        firebaseMessagingToken: firebaseMessagingToken,pushType: 'fcm2',account: userInfo.account!,appid: 0,);
  }
}
