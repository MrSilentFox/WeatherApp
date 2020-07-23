import 'package:flutter/material.dart';
import 'package:my_weather/utilities/global_variables.dart';

class InitialPageProvider extends ChangeNotifier{
  String _city;
  String _language = 'en';

  String get getCity => _city;
  String get getLanguage => _language;

  void setCity(String city){
    this._city = city;
    notifyListeners();
  }

  void setLanguage(String lng){
    _language = lng;
    GlobalVariables.setLanguage(_language);
    notifyListeners();
  }
}