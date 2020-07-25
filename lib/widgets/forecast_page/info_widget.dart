import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/models/current_forecast.dart';
import 'package:my_weather/utilities/global_variables.dart';

Widget infoWidget(CurrentForecast forecast){
  return Column(
    children: <Widget>[
      SizedBox(height: 50,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoCard('${forecast.feelsLike}°', GlobalVariables.getLanguage=='ru' ? 'Ощущается как' : 'Feels Like'),
              infoCard('${forecast.humidity}%', GlobalVariables.getLanguage=='ru' ? 'Влажность' : 'Humidity'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoCard('${forecast.wind} ${GlobalVariables.getLanguage=='ru' ? 'м/с' : 'm/s'}', GlobalVariables.getLanguage=='ru' ? 'Ветер' : 'Wind'),
              infoCard('${forecast.pressure}',GlobalVariables.getLanguage=='ru' ? 'Давление' : 'Pressure'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoCard('${forecast.cloudiness}%', GlobalVariables.getLanguage=='ru' ? 'Облачность' : 'Cloudiness'),
              infoCard('${forecast.rainFall} ${GlobalVariables.getLanguage=='ru' ? 'мм' : 'mm'}', GlobalVariables.getLanguage=='ru' ? 'Осадки' : 'Rain Fall'),
            ],
          )
        ],
      ),
    ],
  );
}

Widget infoCard(String title, String subtitle){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(title, style: TextStyle(color: Colors.white, fontSize: 25),),
      Text(subtitle, style: TextStyle(color: Colors.white),)
    ],
  );
}

/*
infoCard('${forecast.humidity}%', 'Humidity'),
infoCard('${forecast.pressure}', 'Pressure'),
infoCard('${forecast.rainFall}%', 'Rain Fall'),
infoCard('${forecast.feelsLike}°', 'Feels Like'),
infoCard('${forecast.wind} m/s', 'Wind'),
infoCard('${forecast.cloudiness}%', 'Cloudiness'),
*/