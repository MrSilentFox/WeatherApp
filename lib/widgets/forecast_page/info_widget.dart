import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/models/current_forecast.dart';

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
              infoCard('${forecast.feelsLike}°', 'Feels Like'),
              infoCard('${forecast.humidity}%', 'Humidity'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoCard('${forecast.wind} m/s', 'Wind'),
              infoCard('${forecast.pressure}', 'Pressure'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoCard('${forecast.cloudiness}%', 'Cloudiness'),
              infoCard('${forecast.rainFall}mm', 'Rain Fall'),
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