import 'package:ems_app/data/apiResponse/deviceList/DeviceListResponse.dart';
import 'package:ems_app/data/apiResponse/energyListData/EnergyListData.dart';
import 'package:ems_app/data/fakeData/FakeData.dart';
import 'package:ems_app/repository/AccountRepository.dart';
import 'package:ems_app/utils/AppLog.dart';
import 'package:ems_app/utils/sharedPreferences/SharedPreferencesManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';
import '../data/DeviceQrData.dart';
import '../net/remote/Managers/EnergyNodeManager.dart';
import '../net/remote/Managers/WebManager.dart';
import '../repository/EnergyStorageRepository.dart';

enum UpdateStatus {
  updateData,
  updateChart,
}

class EnergyStorageViewModel extends ChangeNotifier {
  EnergyStorageViewModel._();

  static final EnergyStorageViewModel instance = EnergyStorageViewModel._();

  final EnergyStorageRepository energyStorageRepository = EnergyStorageRepository.instance;

  final AccountRepository accountRepository = AccountRepository.instance;

  WebManager webManager = WebManager.instance;

  EnergyNodeManager energyNodeManager = EnergyNodeManager.instance;

  late Tuple2<String, String> deviceAndNode;

  List<DeviceListData> deviceList = [];

  int deviceListIndex = 0;

  UpdateStatus updateStatus = UpdateStatus.updateChart;

  // 電池資訊
  // DeviceGetByIdResponse? batteryInformation = null;
  DeviceListData? batteryInformation = null;

  String deviceId = "";
  String energyStorageId = "";

  // 2024/04/01驗收須改抓指定儲能櫃點位資料
  Future<ChartDataResponse> getChartData(
      String startTime,
      String endTime,
      List<String> fields,
      int interval,
      int lastRequestId,
      int timezone,
      ) async {
    return await energyStorageRepository.getChartData(
      startTime,
      endTime,
      fields,
      interval,
    ).then((tempData) {
      if (tempData != null) {
        List<EnergyData> updatedEnergyList = tempData.energyList.map((energyData) {
          DateTime originalTime = DateTime.parse(energyData.time);
          DateTime adjustedTime = originalTime.add(Duration(seconds: timezone));
          String adjustedTimeStr = adjustedTime.toIso8601String();
          return energyData.copyWith(time: adjustedTimeStr);
        }).toList();

        return ChartDataResponse(
          energyListData: tempData.copyWith(energyList: updatedEnergyList),
          lastRequestId: lastRequestId,
        );
      } else {
        return ChartDataResponse(energyListData: null, lastRequestId: lastRequestId);
      }
    });
  }


  Future<void> getListDevice() async {
    // 更新資料前記住devId，更新資料後要找到對應devId
    updateStatus = UpdateStatus.updateData;
    var tempDevId = "";
    if (deviceList.isNotEmpty && deviceListIndex != -1) {
      tempDevId = deviceList[deviceListIndex].devId;
    }
    final newDeviceList = await energyStorageRepository.getDeviceList();
    List<DeviceListData> deviceListDataList = List.of(newDeviceList);
    deviceListDataList.sort((a, b) => a.name.compareTo(b.name));
    deviceList = deviceListDataList;
    if (deviceList.isNotEmpty) {
      // 暫時用來判斷是否為儲能櫃擁有者
      energyStorageRepository.listUserPermissions();
      // 查詢之前暫存devId是否存在，沒有的話給0
      deviceListIndex = deviceList.indexWhere((device) => device.devId == tempDevId);
      // 如果找到了符合條件的元素，返回它的索引，否則返回 -1
      deviceListIndex = deviceListIndex == -1 ? 0 : deviceListIndex;
      batteryInformation = deviceList[deviceListIndex];
      deviceId = deviceList[deviceListIndex].devId;
      energyStorageId = deviceList[deviceListIndex].id;
    }
    notifyListeners();
  }

  Future<bool> registerDevice(DeviceQrData deviceQrData) async {
    return await energyStorageRepository.addDevice(deviceQrData.toAddDevRequest()).then((addDevResponse) {
      if (addDevResponse != null) {
        energyStorageRepository.setNodeConfigs(addDevResponse.id.toString(), deviceQrData.devInfo.modelId);
        energyStorageRepository.setTimeZone(addDevResponse.id.toString(), deviceQrData.devInfo.name);
        energyStorageRepository.triggerAdd(
            addDevResponse.id, accountRepository.userInfo.uid!, addDevResponse.deviceid, deviceQrData.groups[0]);
        return accountRepository.setGroup(deviceQrData.toSetGroupRequest(addDevResponse.id).toString());
      } else {
        return false;
      }
    });
  }
}

// 圖表用，用來帶回識別值
class ChartDataResponse {
  final EnergyListData? energyListData;
  final int lastRequestId;

  ChartDataResponse({required this.energyListData, required this.lastRequestId});
}
