import 'package:flutter/foundation.dart';

class ApiEndPoint {
  // static const String ipPort = "https://www.ihouseems.com";
  // 正式環境
  // static const String ipPort = "https://www.ihouseems.com";
  // 測試環境
  // static const String ipPort = "http://192.168.11.196";
  // stage環境
  static const String ipPort = "https://stage.ihouseems.com";

  //MARK: - AccountAPI
  static const String accountLogin = "$ipPort/AccountAPI/api/User/login";
  static const String googleLogin = "$ipPort/AccountAPI/api/User/google/login";
  static const String appleLogin = "$ipPort/AccountAPI/api/User/apple/login";
  static const String userInfo = "$ipPort/AccountAPI/api/User/info";
  static const String delUser = "$ipPort/AccountAPI/api/User/delUser";
  static const String setGroup = "$ipPort/AccountAPI/api/Acl/Device/setGroup";
  static const String googleCheck = "$ipPort/AccountAPI/api/User/google/check";
  static const String appleCheck = "$ipPort/AccountAPI/api/User/apple/check";
  static const String setUser = "$ipPort/AccountAPI/api/Acl/Device/setUser";
  static const String userNew = "$ipPort/AccountAPI/api/User/new";
  static const String userAttr = "$ipPort/AccountAPI/api/User/attr/";
  static const String uploadAvatar = "$ipPort/WebAPI/File";
  static const String getAvatar = "$ipPort/cfs/download/";
  static const String pushInfoSet = "$ipPort/WebAPI/api/PushInfo/set";

  //MARK: - ENERGY
  static const String listTreeData = "$ipPort/WebAPI/TreeData/listTreedata/";
  static const String configSearch = "$ipPort/WebAPI/api/GroupDataStore/get/";
  static const String pageConfigs = "/pageConfigs/";
  static const String getNodeConfigs = "$ipPort/WebAPI/api/CommunityDataStore/get/20000000-0000-0000-0000-000000000001/nodeConfigs/modelId_";
  static const String deviceGetById = "$ipPort/DeviceAPI/api/Device/getById/";
  static const String listDevice = '$ipPort/DeviceAPI/api/Device/list/';
  static const String listDeviceById= '$ipPort/DeviceAPI/api/Device/getById/';
  static const String addDevice= '$ipPort/DeviceAPI/api/Device/addDev';
  static const String addDevNode= '$ipPort/DeviceAPI/api/Device/addDevNode';
  static const String setTimeZone = "$ipPort/DeviceAPI/api/Device/update/";
  static const String triggerAdd = "$ipPort/WebAPI/api/Trigger/add";
  static const String triggerRegister = "$ipPort/WebAPI/api/Trigger/ESCV2/register/";
  static const String listUserPermissions = "$ipPort/AccountAPI/api/Acl/Device/listUser"; //暫時用來篩選是否為儲能櫃擁有者

  // 下控指令
  static const String setValue = '$ipPort/WebAPI/api/Device/sendCmd/setValue/';

  //MARK: - ReportAPI
  static const String getChartData =
      "$ipPort/ReportAPI/reportapi/historyValueStatisticsWithInterval2/";
}
