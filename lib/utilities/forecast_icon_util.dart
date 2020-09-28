import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class IconUtill{
  static Widget getIcon(String description, Color color){
    if(description.toLowerCase().contains('rain') || description.toLowerCase().contains('дождь')){
      return BoxedIcon(WeatherIcons.rain, color: color,);
    }else if(description.toLowerCase().contains('thunder') || description.toLowerCase().contains('гроза')){
      return BoxedIcon(WeatherIcons.thunderstorm, color: color);
    } else if(description.toLowerCase().contains('cloud') || description.toLowerCase().contains('обла') || description.toLowerCase().contains('пасмурно')){
      return BoxedIcon(WeatherIcons.cloud, color: color);
    }else if(description.toLowerCase().contains('snow') || description.toLowerCase().contains('снег')){
      return BoxedIcon(WeatherIcons.snow, color: color);
    }else {
      return BoxedIcon(WeatherIcons.day_sunny, color: color);
    }
  }
}