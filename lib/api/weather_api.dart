import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/utilities/constants.dart';
import 'package:my_weather/utilities/global_variables.dart';

class WeatherApi{
  Future<WeatherForecast> fetchWeatherForecast({String cityName}) async{

    Map<String, String> parameters;
    Map<String, String> queryParameters;

    if(GlobalVariables.getLanguage=='ru'){
      queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'q' : cityName,
        'lang' : 'ru'
      };
    }else{
      queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'q' : cityName,
      };
    }

    parameters = queryParameters;

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH,parameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if(response.statusCode==200){
      return WeatherForecast.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }

  Future<WeatherForecast> fetchWeatherForecastFromLocation() async{

    Map<String, String> parameters;
    Map<String, String> queryParameters;
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    if(GlobalVariables.getLanguage=='ru'){
      queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'lat' : position.latitude.toString(),
        'lon' : position.longitude.toString(),
        'lang' : 'ru'
      };
    }else{
      queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'lat' : position.latitude.toString(),
        'lon' : position.longitude.toString(),
      };
    }

    parameters = queryParameters;

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH,parameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if(response.statusCode==200){
      return WeatherForecast.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }
}