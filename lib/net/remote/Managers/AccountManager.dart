import 'dart:convert';
import "package:ems_app/data/apiRequest/appleCheck/AppleCheckParams.dart";
import "package:ems_app/data/apiRequest/appleLogin/AppleLoginBody.dart";
import "package:ems_app/data/apiRequest/changeUserName/ChangeUserNameBody.dart";
import "package:ems_app/data/apiRequest/deleteUser/DeleteUserParams.dart";
import "package:ems_app/data/apiRequest/googleCheck/GoogleCheckParams.dart";
import "package:ems_app/data/apiRequest/googleLogin/GoogleLoginBody.dart";
import "package:ems_app/data/apiRequest/login/LoginBody.dart";
import "package:ems_app/data/apiRequest/pushInfoSet/PushInfoSetBody.dart";
import "package:ems_app/data/apiRequest/setAvatar/SetAvatarBody.dart";
import "package:ems_app/data/apiRequest/uploadAvatar/UploadAvatarBody.dart";
import "package:ems_app/data/apiRequest/userNew/UserNewBody.dart";
import "package:ems_app/data/apiResponse/appleCheck/AppleCheckResponse.dart";
import "package:ems_app/data/apiResponse/deleteUser/DeleteUserResponse.dart";
import "package:ems_app/data/apiResponse/googleCheck/GoogleCheckResponse.dart";
import "package:ems_app/data/apiResponse/login/LoginResponse.dart";
import "package:ems_app/data/apiResponse/setGroup/SetGroupResponse.dart";
import "package:ems_app/data/apiResponse/setUser/SetUserResponse.dart";
import "package:ems_app/data/apiResponse/uploadAvatar/UploadAvatarResponse.dart";
import "package:ems_app/data/apiResponse/userInfo/UserInfoResponse.dart";
import "package:ems_app/data/apiResponse/userNew/UserNewResponse.dart";
import "package:ems_app/net/remote/ApiEndPoint.dart";
import "package:ems_app/net/remote/NetworkInterface.dart";

class AccountManager {
  AccountManager._();

  static final AccountManager instance = AccountManager._();

  NetworkInterface network = NetworkInterface();

  Future<LoginResponseData?> login({required String account, required String password}) async {
    try {
      var body = LoginBody(acc: account, pwd: password);
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.accountLogin}';
        return network.post(url: url, body: body);
      });
      LoginResponse loginResponse = LoginResponse.fromJson(response.data as Map<String, dynamic>);
      return loginResponse.data;
    } catch (e) {
      print('Failed to listTreeData: $e');
      return null;
    }
  }

  Future<LoginResponseData?> googleLogin(GoogleLoginBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.googleLogin}';
        return network.post(url: url, body: body);
      });
      LoginResponse loginResponse = LoginResponse.fromJson(response.data as Map<String, dynamic>);
      return loginResponse.data;
    } catch (e) {
      print('Failed to googleLogin: $e');
      return null;
    }
  }

  Future<LoginResponseData?> appleLogin(AppleLoginBody appleLoginBody) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.appleLogin;
        return network.post(url: url, body: appleLoginBody);
      });
      LoginResponse loginResponse = LoginResponse.fromJson(response.data as Map<String, dynamic>);
      return loginResponse.data;
    } catch (e) {
      print('Failed to appleLogin: $e');
      return null;
    }
  }

  Future<bool?> delUser(DeleteUserParams params, String token) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.delUser}';
        return network.delete(url: url, userToken: token, query: params.toJson());
      });
      DeleteUserResponse deleteUserResponse = DeleteUserResponse.fromJson(response.data as Map<String, dynamic>);
      return deleteUserResponse.data;
    } catch (e) {
      print('Failed to googleLogin: $e');
      return null;
    }
  }

  Future<UserInfoData?> getUserInfo(String token) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.userInfo;
        return network.get(url: url, userToken: token);
      });
      UserInfoResponse userInfoResponse = UserInfoResponse.fromJson(response.data as Map<String, dynamic>);
      return userInfoResponse.data;
    } catch (e) {
      print('Failed to getUserInfo: $e');
      return null;
    }
  }

  Future<bool> setGroup(String token, String setGroupRequest) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setGroup}';
        return network.post(url: url, userToken: token, body: setGroupRequest);
      });
      SetGroupResponse setGroupResponse = SetGroupResponse.fromJson(response.data as Map<String, dynamic>);
      return true;
    } catch (e) {
      print('Failed to setGroup: $e');
      return false;
    }
  }

  Future<bool> googleCheck(String token, String uid) async {
    try {
      final params = GoogleCheckParams(uid: uid);
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.googleCheck;
        return network.get(url: url, userToken: token, query: params.toJson());
      });
      GoogleCheckResponse googleCheckResponse = GoogleCheckResponse.fromJson(response.data as Map<String, dynamic>);
      return googleCheckResponse.data;
    } catch (e) {
      print('Failed to googleCheck: $e');
      return false;
    }
  }

  Future<bool> appleCheck(String token, {required String uid}) async {
    try {
      AppleCheckParams params = AppleCheckParams(uid: uid);
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.appleCheck;
        return network.get(url: url, userToken: token, query: params.toJson());
      });
      AppleCheckResponse appleCheckResponse = AppleCheckResponse.fromJson(response.data as Map<String, dynamic>);
      return appleCheckResponse.data;
    } catch (e) {
      print('Failed to appleCheck: $e');
      return false;
    }
  }

  Future<bool> changeUserName(String token, String uid, {required String name}) async {
    try {
      ChangeUserNameBody body = ChangeUserNameBody(name: name);
      var response = await network.wrapperHttpError(() {
        var url = "${ApiEndPoint.userInfo}/$uid";
        return network.post(url: url, userToken: token, body: body);
      });
      return true;
    } catch (e) {
      print('Failed to getUserInfo: $e');
      return false;
    }
  }

  Future<bool> setUser(String token, String setUserRequest) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setUser}';
        return network.post(url: url, userToken: token, body: setUserRequest);
      });
      SetUserResponse setGroupResponse = SetUserResponse.fromJson(response.data as Map<String, dynamic>);
      return setGroupResponse.result == 0;
    } catch (e) {
      print('Failed to setGroup: $e');
      return false;
    }
  }

  Future<bool> userNew({required String name,required  String acc,required  String pwd,}) async {
    try {
      final body = UserNewBody(name: name,acc: acc,pwd: pwd,);
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.userNew;
        return network.post(url: url, body: body);
      });
      Map<String, dynamic> responseData = jsonDecode(response.toString());
      UserNewResponse userNewResponse = UserNewResponse.fromJson(response.data as Map<String, dynamic>);
      return true;
    } catch (e) {
      print('Failed to userNew: $e');
      return false;
    }
  }

  Future<String?> uploadAvatar(String token, UploadAvatarBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.uploadAvatar;
        return network.post(url: url, body: body.toFormData());
      });
      final responseData = response.data is String
          ? jsonDecode(response.data as String)
          : response.data as Map<String, dynamic>;

      UploadAvatarResponse uploadAvatarResponse = UploadAvatarResponse.fromJson(responseData);
      return uploadAvatarResponse.data;
    } catch (e) {
      print('Failed to uploadAvatar: $e');
      return null;
    }
  }

  Future<bool> setAvatar(String token, String uid, {required String avatar}) async {
    try {
      final body = SetAvatarBody(avatar: avatar);

      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.userAttr}$uid';
        return network.put(url: url, userToken: token, body: body);
      });
      return true;
    } catch (e) {
      print('Failed to setAvatar: $e');
      return false;
    }
  }

  Future<bool> pushInfoSet(
    String token, {
    required String firebaseMessagingToken,
    required String pushType,
    required String account,
    required int appid,
  }) async {
    try {
      final body = PushInfoSetBody(
        token: firebaseMessagingToken,
        pushType: "fcm2",
        account: account,
        appid: 0,
      );
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.pushInfoSet;
        return network.post(
          url: url,
          userToken: token,
          body: body,
        );
      });
      return true;
    } catch (e) {
      print('Failed to pushInfoSet: $e');
      return false;
    }
  }
}
