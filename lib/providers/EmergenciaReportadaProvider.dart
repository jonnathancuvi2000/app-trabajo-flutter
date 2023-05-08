import 'package:flutter/cupertino.dart';

class EmergenciaReportadaProvider with ChangeNotifier{

  var _currentEmergency = {};
  bool _isNewEmergency = false;

  get currentEmergency => _currentEmergency;
  get isNewEmergency => _isNewEmergency;

  Future<void> setEmergenciaReportada({required newEmergency}) async {
    _currentEmergency = newEmergency;
    _isNewEmergency = true;
  }

}