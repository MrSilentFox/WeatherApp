import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';

Widget weatherImage(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){

  var forecastList = snapshot.data.list;
  var description = forecastList[0].weather[0].description.toUpperCase();
  var date = DateTime.now();
  print(date.hour);

  return Container(
    child: Image(image: AssetImage(getImage(description, date)),),
  );
}

String getImage(String description, DateTime date){
  if(description.toLowerCase().contains('rain') || description.toLowerCase().contains('дождь')){
    return 'assets/rain.png';
  }else if(description.toLowerCase().contains('thunder') || description.toLowerCase().contains('гроза')){
    return 'assets/thunder.png';
  }else if(description.toLowerCase().contains('cloud') || description.toLowerCase().contains('обла')){
    return 'assets/clouds.png';
  }else if(date.hour>10 && date.hour < 22){
    return 'assets/clear_sky_day.png';
  }else{
    return 'assets/clear_sky_night.png';
  }
}