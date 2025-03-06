import 'dart:convert';
import "package:ems_app/data/apiRequest/addDevNode/AddDevNodeParams.dart";
import "package:ems_app/data/apiRequest/historyValueStatistics/HistoryValueStatisticsParams.dart";
import "package:ems_app/data/apiRequest/setTimeZone/SetTimeZoneBody.dart";
import "package:ems_app/data/apiResponse/addDevNode/AddDevNodeResponse.dart";
import "package:ems_app/data/apiResponse/addDevice/AddDeviceResponse.dart";
import "package:ems_app/data/apiResponse/deviceList/DeviceListResponse.dart";
import "package:ems_app/data/apiResponse/energyListData/EnergyListData.dart";
import "package:ems_app/data/apiResponse/listUserPermissions/ListUserPermissionsResponse.dart";
import "package:ems_app/data/apiResponse/nodeConfigs/NodeConfigsResponse.dart";
import "package:ems_app/data/apiResponse/triggerRegister/TriggerRegisterResponse.dart";
import "package:ems_app/net/remote/ApiEndPoint.dart";
import "package:ems_app/net/remote/NetworkInterface.dart";
import "package:ems_app/viewModel/EnergyStorageViewModel.dart";
import "../../../data/apiRequest/listUserPermissions/ListUserPermissionsParams.dart";
import "../../../repository/AccountRepository.dart";

class WebManager {
  WebManager._();

  static final WebManager instance = WebManager._();

  NetworkInterface network = NetworkInterface();

  final AccountRepository accountRepository = AccountRepository.instance;

  late String currentGroupId;

  late String groupIdParent;

  late String id;

  late String oid;

  late String defineType;

  late String deviceID;

  // 04/01驗收先給指定的ID：inverter01
  Future<EnergyListData?> getChartData(String startTime, String endTime, List<String> fields, int interval) async {
    try {
      var response = await network.wrapperHttpError(() {
        String field = "\$time,${fields.join(',')}";
        String titles = "time,${fields.map((field) => '${field.substring(0, field.length - 4)}').join(',')}";
        var request = HistoryValueStatisticsParams(
            startTime: startTime, endTime: endTime, fields: field, interval: interval, titles: titles);
        var url = '${ApiEndPoint.getChartData}${EnergyStorageViewModel.instance.deviceId}';
        return network.get(url: url, userToken: accountRepository.token, query: request.toJson());
      });
      Map<String, dynamic> energyDatas = response.data;
      List<String> titleList = fields.map((field) => "$field").toList();
      EnergyListData energyListData = EnergyListDataExtensions.parseFromJson(energyDatas, titleList);

      return energyListData;
    } catch (e) {
      print('Failed to get getChartData: $e');
      return null;
    }
  }

  Future<List<DeviceListData>> getDeviceList() async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.listDevice}';
        return network.get(url: url, userToken: accountRepository.token);
      });
      Map<String, dynamic> responseData = jsonDecode(response.toString());
      DeviceListResponse deviceListResponse = DeviceListResponse.fromJson(responseData);
      return deviceListResponse.data;
    } catch (e) {
      print('Failed to getDeviceList: $e');
      return [];
    }
  }

  Future<AddDeviceData?> addDevice(String addDeviceRequest) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.addDevice}';
        return network.post(url: url, userToken: accountRepository.token, body: addDeviceRequest);
      });
      final addDeviceResponse = AddDeviceResponse.fromJson(response.data as Map<String, dynamic>);
      return addDeviceResponse.data;
    } catch (e) {
      print('Failed to addDevice: $e');
      return null;
    }
  }

  Future<List<NodeConfig>> getNodeConfigs(int modelId) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.getNodeConfigs}$modelId';
        return network.get(url: url, userToken: accountRepository.token);
      });

      if (response.data is Map<String, dynamic>) {
        NodeConfigsResponse deviceListResponse =
        NodeConfigsResponse.fromJson(response.data as Map<String, dynamic>);
        return deviceListResponse.data;
      } else {
        throw Exception('Unexpected response format: ${response.data.runtimeType}');
      }
    } catch (e) {
      print('Failed to getNodeConfigs: $e');
      return [];
    }
  }

  Future<bool> addDevNode(AddDevNodeParams addDevNodeParams) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.addDevNode;
        return network.post(
            url: url, userToken: accountRepository.token, body: addDevNodeParams.toJson());
      });
      final addDevNodeResponse = AddDevNodeResponse.fromJson(response.data as Map<String, dynamic>);
      return (addDevNodeResponse.result == 0);
    } catch (e) {
      print('Failed to addDevNode: $e');
      return false;
    }
  }

  Future<bool> setTimeZone(SetTimeZoneBody body, String id) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = "${ApiEndPoint.setTimeZone}$id";
        return network.post(
            url: url, userToken: accountRepository.token, body: body);
      });
      return true;
    } catch (e) {
      print('Failed to setTimeZone: $e');
      return false;
    }
  }

  Future<bool> triggerRegister(String deviceUid) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = "${ApiEndPoint.triggerRegister}$deviceUid";
        return network.put(
            url: url, userToken: accountRepository.token);
      });
      TriggerRegisterResponse triggerRegisterResponse = TriggerRegisterResponse.fromJson(response.data as Map<String,
       dynamic>);
      return triggerRegisterResponse.result == 0;
    } catch (e) {
      print('Failed to triggerAdd: $e');
      return false;
    }
  }

  Future<Map<String, PermissionInfo>> listUserPermissions(ListUserPermissionsParams params) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = ApiEndPoint.listUserPermissions;
        return network.get(
            url: url, userToken: accountRepository.token, query: params.toJson());
      });
      ListUserPermissionsResponse listUserPermissionsResponse = ListUserPermissionsResponse.fromJson(response.data as
      Map<String, dynamic>);
      return listUserPermissionsResponse.data[params.accountids]!;
    } catch (e) {
      print('Failed to listUserPermissions: $e');
      return {};
    }
  }
}
