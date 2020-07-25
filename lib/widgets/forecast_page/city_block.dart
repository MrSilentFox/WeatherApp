import 'package:flutter/material.dart';
import 'package:my_weather/models/current_forecast.dart';
import 'package:my_weather/utilities/global_variables.dart';

Widget cityBlock(BuildContext context ,CurrentForecast forecast){

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('${forecast.description} ${GlobalVariables.getLanguage=='ru' ? 'в' : 'at'}', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25),),
        Text('${forecast.city}', style: TextStyle(color: Colors.white, fontSize: 40),),
        Text('${forecast.temperature}°', style: TextStyle(color: Colors.white, fontSize: 85),)
      ],
    ),
  );
}