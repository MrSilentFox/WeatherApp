import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/models/current_forecast.dart';

Widget weatherImage(CurrentForecast currentForecast){
  var description = currentForecast.description;
  var date = DateTime.now();
  print(date.hour);

    if(description.toLowerCase().contains('rain') || description.toLowerCase().contains('дождь')){
      return FlareActor('assets/animations/rainfall_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else if(description.toLowerCase().contains('thunder') || description.toLowerCase().contains('гроза')){
      return FlareActor('assets/animations/thunder_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else if(description.toLowerCase().contains('snow') || description.toLowerCase().contains('снег')){
      return FlareActor('assets/animations/snow.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else if(description.toLowerCase().contains('cloud') || description.toLowerCase().contains('обла') || description.toLowerCase().contains('пасмурно')){
      return FlareActor('assets/animations/clouds_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else if(date.hour>6 && date.hour < 21){
      return FlareActor('assets/animations/sun_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else{
      return FlareActor('assets/animations/moon_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }



}