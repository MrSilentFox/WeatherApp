import 'package:flutter/material.dart';
import 'package:my_weather/models/city.dart';

class GlobalVariables{
  static String _language = 'en';
  static Color _mainColor = Color.fromRGBO(35, 41, 44, 1);
  static Color _primaryColor = Colors.tealAccent;
  static Color _textColor = Colors.white;

  static String get getLanguage => _language;
  static void setLanguage(String value) => _language = value;

  static Color get getMainColor => _mainColor;
  static Color get getPrimaryColor => _primaryColor;
  static Color get getTextColor => _textColor;

  static List<CityTemplate> cityList = [
    CityTemplate(rusName: 'Винница', enName: 'Vinnytsia'),
    CityTemplate(rusName: 'Днепропетровск', enName: 'Dnipropetrovsk'),
    CityTemplate(rusName: 'Донецк', enName: 'Donetsk'),
    CityTemplate(rusName: 'Житомир', enName: 'Zhytomyr'),
    CityTemplate(rusName: 'Запорожье', enName: 'Zaporizhzhia'),
    CityTemplate(rusName: 'Ивано-Франковск', enName: 'Ivano-Frankivsk'),
    CityTemplate(rusName: 'Киев', enName: 'Kyiv'),
    CityTemplate(rusName: 'Кировоград', enName: 'Kirovohrad'),
    CityTemplate(rusName: 'Луганск', enName: 'Luhansk'),
    CityTemplate(rusName: 'Луцк', enName: 'Lutsk'),
    CityTemplate(rusName: 'Львов', enName: 'Lviv'),
    CityTemplate(rusName: 'Николаев', enName: 'Mykolaiv'),
    CityTemplate(rusName: 'Одесса', enName: 'Odesa'),
    CityTemplate(rusName: 'Полтава', enName: 'Poltava'),
    CityTemplate(rusName: 'Ровно', enName: 'Rivne'),
    CityTemplate(rusName: 'Севастополь', enName: 'Sevastopol'),
    CityTemplate(rusName: 'Симферополь', enName: 'Simferopol'),
    CityTemplate(rusName: 'Сумы', enName: 'Sumy'),
    CityTemplate(rusName: 'Тернополь', enName: 'Ternopil'),
    CityTemplate(rusName: 'Ужгород', enName: 'Uzhhorod'),
    CityTemplate(rusName: 'Харьков', enName: 'Kharkiv'),
    CityTemplate(rusName: 'Херсон', enName: 'Kherson'),
    CityTemplate(rusName: 'Хмельницкий', enName: 'Khmelnytskyi'),
    CityTemplate(rusName: 'Черкассы', enName: 'Cherkasy'),
    CityTemplate(rusName: 'Черновцы', enName: 'Chernivtsi'),
    CityTemplate(rusName: 'Чернигов', enName: 'Chernihiv')
  ];
}