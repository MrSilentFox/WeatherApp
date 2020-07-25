import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/utilities/date_util.dart';

class CurrentForecast {
  String city;
  String description;
  String temperature;
  String feelsLike;
  String wind;
  String humidity;
  String pressure;
  String rainFall;
  String cloudiness;
  String day;
}

class LoadCurrentForecast {
  static CurrentForecast getCurrentForecast(
      AsyncSnapshot<WeatherForecast> snapshot, int currentDay) {
    CurrentForecast result = CurrentForecast();

    var forecast = snapshot.data.list[currentDay];
    result.city = snapshot.data.city.name;
    result.description = forecast.weather[0].description;
    result.temperature = forecast.temp.day.round().toString();
    result.feelsLike = forecast.feelsLike.day.round().toString();
    result.wind = forecast.speed.toString();
    result.humidity = forecast.humidity.toString();
    result.pressure = (forecast.pressure * 0.75).round().toString();
    result.rainFall = forecast.rain.toString();
    result.cloudiness = forecast.clouds.toString();
    var dateTime = DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
    result.day = Util.getFormatDate(dateTime);

    if(result.rainFall=='null'){result.rainFall='0';}

    return result;
  }
}
