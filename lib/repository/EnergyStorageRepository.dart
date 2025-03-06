import 'package:ems_app/data/apiRequest/addDevNode/AddDevNodeParams.dart';
import 'package:ems_app/data/apiRequest/setTimeZone/SetTimeZoneBody.dart';
import 'package:ems_app/data/apiResponse/addDevice/AddDeviceResponse.dart';
import 'package:ems_app/data/apiResponse/attrs/Attrs.dart';
import 'package:ems_app/data/apiResponse/deviceList/DeviceListResponse.dart';
import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/data/apiResponse/listUserPermissions/ListUserPermissionsResponse.dart';
import 'package:ems_app/net/remote/NetworkInterface.dart';
import '../data/apiRequest/listUserPermissions/ListUserPermissionsParams.dart';
import '../net/remote/Managers/WebManager.dart';
import 'AccountRepository.dart';

class EnergyStorageRepository {
  EnergyStorageRepository._();

  static final EnergyStorageRepository instance = EnergyStorageRepository._();

  WebManager webManager = WebManager.instance;

  final AccountRepository accountRepository = AccountRepository.instance;

  NetworkInterface network = NetworkInterface();

  List<DeviceListData> deviceList = [];

  Map<String, PermissionInfo> userPermissionsMap = {};

  Future<EnergyListData?> getChartData(
    String startTime,
    String endTime,
    List<String> fields,
    int interval,
  ) async {
    return webManager.getChartData(
      startTime,
      endTime,
      fields,
      interval,
    );
  }

  Future<List<DeviceListData>> getDeviceList() async {
    return await webManager.getDeviceList();
  }

  Future<AddDeviceData?> addDevice(
    String addDeviceRequest,
  ) async {
    return await webManager.addDevice(addDeviceRequest);
  }

  Future<bool> setNodeConfigs(String devId, int modelId) async {
    webManager.getNodeConfigs(modelId).then((value) {
      AddDevNodeParams addDevNodeParams = AddDevNodeParams(
        devid: devId,
        nodes: value,
      );
      return webManager.addDevNode(addDevNodeParams);
    });
    return false;
  }

  Future<bool> setTimeZone(String id, String name) async {
    ;
    return await webManager.setTimeZone(SetTimeZoneBody(
      attrs: Attrs(
        timezone: "Asia/Taipei(GMT+08:00)",
        timezoneVal: "+28800",
      ),
      name: name,
    ), id);
  }

  Future<bool> triggerAdd(String deviceUid, String uid, String devid, String groupId) async {
    return await webManager.triggerRegister(deviceUid);
  }

  Future<void> listUserPermissions() async {
    userPermissionsMap = await webManager.listUserPermissions(ListUserPermissionsParams(accountids: accountRepository
            .userInfo.uid!));
  }

}
