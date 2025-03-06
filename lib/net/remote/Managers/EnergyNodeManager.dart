
import 'package:ems_app/net/remote/Managers/WebManager.dart';

class EnergyNodeManager {

  EnergyNodeManager._();

  static final EnergyNodeManager instance = EnergyNodeManager._();
  
  WebManager webManager = WebManager.instance; 

}