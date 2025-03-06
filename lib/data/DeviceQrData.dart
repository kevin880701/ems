import 'dart:convert';

class DeviceQrData {
  DevInfo devInfo;
  List<String> groups;

  DeviceQrData({required this.devInfo, required this.groups});

  factory DeviceQrData.fromJson(Map<String, dynamic> json) {
    return DeviceQrData(
      devInfo: DevInfo.fromJson(json['devinfo'] ?? {}),
      groups: json['groups'] != null ? List<String>.from(json['groups']) : [],
    );
  }

  // 檢查字串是否符合格式
  static bool isValidFormat(String jsonString) {
    try {
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      if (jsonData.containsKey('devinfo') &&
          jsonData['devinfo'] is Map &&
          jsonData.containsKey('groups') &&
          jsonData['groups'] is List) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String toAddDevRequest() {
    return jsonEncode(devInfo);
  }

  String toSetGroupRequest(String deviceId) {
    Map<String, dynamic> result = {};
    if (groups != null) {
      for (String group in groups!) {
        result[group] = {
          deviceId: {
            'permission': 7,
            'ruleFlag': 0,
          }
        };
      }
    }
    return jsonEncode(result);
  }
}

class DevInfo {
  String devid;
  String name;
  int modelId;

  DevInfo({required this.devid, required this.name, required this.modelId});

  factory DevInfo.fromJson(Map<String, dynamic> json) {
    int? modelIdInt = int.tryParse(json['modelId'].toString());
    int modelId = modelIdInt ?? 0;
    return DevInfo(
      devid: json['devid'] ?? '',
      name: json['name'] ?? '',
      modelId: modelId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'devid': devid,
      'name': name,
      'modelId': modelId,
    };
  }
}
