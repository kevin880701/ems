import 'package:ems_app/data/apiRequest/sendBatteryPriorityModeCmd/SendBatteryPriorityModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendPeakShavingModeCmd/SendPeakShavingModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/sendSelfUseModeCmd/SendSelfUseModeCmdBody.dart';
import 'package:ems_app/data/apiRequest/setPeakShavingModeTime/SetPeakShavingModeTimeBody.dart';
import 'package:ems_app/data/apiRequest/setSelfUseModeTime/SetSelfUseModeTimeBody.dart';
import 'package:ems_app/net/remote/NetworkInterface.dart';
import '../net/remote/Managers/CommandModeManager.dart';

class CommandRepository {
  CommandRepository._();

  static final CommandRepository instance = CommandRepository._();
  NetworkInterface network = NetworkInterface();

  CommandModeManager commandModeManager = CommandModeManager.instance;

  Future<bool> sendSelfUseModeCmd(SendSelfUseModeCmdBody body) async {
    return commandModeManager.sendSelfUseModeCmd(body);
  }

  Future<bool> sendBatteryPriorityModeCmd(SendBatteryPriorityModeCmdBody sendBatteryPriorityModeCmdBody) async {
    return commandModeManager.sendBatteryPriorityModeCmd(sendBatteryPriorityModeCmdBody);
  }

  Future<bool> sendPeakShavingModeCmd(SendPeakShavingModeCmdBody body) async {
    return commandModeManager.sendPeakShavingModeCmd(body);
  }

  Future<bool> setSelfUseModeTime(SetSelfUseModeTimeBody body) async {
    return commandModeManager.setSelfUseModeTime(body);
  }

  Future<bool> setPeakShavingModeTime(SetPeakShavingModeTimeBody body) async {
    return commandModeManager.setPeakShavingModeTime(body);
  }
}
