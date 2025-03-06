
import "dart:convert";

import "package:ems_app/data/apiRequest/sendBatteryPriorityModeCmd/SendBatteryPriorityModeCmdBody.dart";
import "package:ems_app/data/apiRequest/sendPeakShavingModeCmd/SendPeakShavingModeCmdBody.dart";
import "package:ems_app/data/apiRequest/sendSelfUseModeCmd/SendSelfUseModeCmdBody.dart";
import "package:ems_app/data/apiRequest/setPeakShavingModeTime/SetPeakShavingModeTimeBody.dart";
import "package:ems_app/data/apiRequest/setSelfUseModeTime/SetSelfUseModeTimeBody.dart";
import "package:ems_app/data/apiResponse/setValue/SetValueResponse.dart";
import "package:ems_app/net/remote/ApiEndPoint.dart";
import "package:ems_app/net/remote/NetworkInterface.dart";
import "../../../repository/AccountRepository.dart";
import "../../../viewModel/EnergyStorageViewModel.dart";

class CommandModeManager {
  CommandModeManager._();

  static final CommandModeManager instance = CommandModeManager._();

  NetworkInterface network = NetworkInterface();

  final AccountRepository accountRepository = AccountRepository.instance;

  late EnergyStorageViewModel energyStorageViewModel =
      EnergyStorageViewModel.instance;

  Future<bool> sendSelfUseModeCmd(SendSelfUseModeCmdBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setValue}${energyStorageViewModel.energyStorageId}';
        // var url = '${ApiEndPoint.setValue}${accouuntRepository.getGroupId()}';
        return network.post(url: url, body: body, userToken: accountRepository.token);
      });

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data as String)
            : response.data as Map<String, dynamic>;

        SetValueResponse setValueResponse = SetValueResponse.fromJson(responseData);
        return setValueResponse.result == 0;
      } else {
        return false;
      }
    } catch (e) {
      print('Error setting value: $e');
      return false;
    }
  }


  Future<bool> sendBatteryPriorityModeCmd(SendBatteryPriorityModeCmdBody sendBatteryPriorityModeCmdBody) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setValue}${energyStorageViewModel.energyStorageId}';
        // var url = '${ApiEndPoint.setValue}${accouuntRepository.getGroupId()}';
        return network.post(url: url, body: sendBatteryPriorityModeCmdBody, userToken: accountRepository.token);
      });

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data as String)
            : response.data as Map<String, dynamic>;

        SetValueResponse setValueResponse = SetValueResponse.fromJson(responseData);
        return setValueResponse.result == 0;
      } else {
        return false;
      }
    } catch (e) {
      print('Error setting value: $e');
      return false;
    }
  }

  Future<bool> sendPeakShavingModeCmd(SendPeakShavingModeCmdBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setValue}${energyStorageViewModel.energyStorageId}';
        // var url = '${ApiEndPoint.setValue}${accouuntRepository.getGroupId()}';
        return network.post(url: url, body: body, userToken: accountRepository.token);
      });

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data as String)
            : response.data as Map<String, dynamic>;

        SetValueResponse setValueResponse = SetValueResponse.fromJson(responseData);
        return setValueResponse.result == 0;
      } else {
        return false;
      }
    } catch (e) {
      print('Error setting value: $e');
      return false;
    }
  }

  Future<bool> setSelfUseModeTime(SetSelfUseModeTimeBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setValue}${energyStorageViewModel.energyStorageId}';
        // var url = '${ApiEndPoint.setValue}${accouuntRepository.getGroupId()}';
        return network.post(url: url, body: body, userToken: accountRepository.token);
      });

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data as String)
            : response.data as Map<String, dynamic>;

        SetValueResponse setValueResponse = SetValueResponse.fromJson(responseData);
        return setValueResponse.result == 0;
      } else {
        return false;
      }
    } catch (e) {
      print('Error setting value: $e');
      return false;
    }
  }

  Future<bool> setPeakShavingModeTime(SetPeakShavingModeTimeBody body) async {
    try {
      var response = await network.wrapperHttpError(() {
        var url = '${ApiEndPoint.setValue}${energyStorageViewModel.energyStorageId}';
        // var url = '${ApiEndPoint.setValue}${accouuntRepository.getGroupId()}';
        return network.post(url: url, body: body, userToken: accountRepository.token);
      });

      if (response.statusCode == 200) {
        final responseData = response.data is String
            ? jsonDecode(response.data as String)
            : response.data as Map<String, dynamic>;

        SetValueResponse setValueResponse = SetValueResponse.fromJson(responseData);
        return setValueResponse.result == 0;
      } else {
        return false;
      }
    } catch (e) {
      print('Error setting value: $e');
      return false;
    }
  }
}
