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
    }else if(description.toLowerCase().contains('cloud') || description.toLowerCase().contains('обла')){
      return FlareActor('assets/animations/clouds_animation.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else if(date.hour>10 && date.hour < 22){
      return FlareActor('assets/animations/sun_animations.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }else{
      return FlareActor('assets/animations/moon_animations.flr',
          alignment: Alignment.topCenter, animation: 'run');
    }



}