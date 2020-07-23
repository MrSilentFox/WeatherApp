import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/utilities/global_variables.dart';
import 'package:pit_slider_carousel/pit_slider_carousel.dart';

Widget infoWidget(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){
  CarouselItem firstItem = CarouselItem(firstPage(context, snapshot));
  CarouselItem secondItem = CarouselItem(secondPage(context, snapshot));

  List<CarouselItem> list = [firstItem, secondItem];

  CarouselController ctrl = CarouselController(carouselItems: list);

  return Container(
    width: MediaQuery.of(context).size.width,
    child: PitSliderCarousel(
        maxDotsIndicator: 10,
        dotSize: 6.0,
        activeDotColor: Colors.white,
        dotColor: Colors.grey[600],
        useDot: true,
        animationCurve: Curves.easeInOut,
        autoPlay: false,
        dotPosition: Position(bottom: -10.0),
        carouselController: ctrl
    ),
  );
}

Widget firstPage(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){

  var cityName = snapshot.data.city.name;
  var forecastList = snapshot.data.list;
  var description = forecastList[0].weather[0].description;
  var dayTemp = forecastList[0].temp.day.round();

  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('$description ${GlobalVariables.getLanguage=='ru' ? 'в' : 'at'}', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25),),
        Text('$cityName', style: TextStyle(color: Colors.white, fontSize: 40),),
        Text('$dayTemp°', style: TextStyle(color: Colors.white, fontSize: 85),)
      ],
    ),
  );
}

Widget secondPage(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){
  var forecastList = snapshot.data.list;
  var windSpeed = forecastList[0].speed;
  var sunset = DateTime.fromMillisecondsSinceEpoch(forecastList[0].sunset * 1000);
  var sunrise = DateTime.fromMillisecondsSinceEpoch(forecastList[0].sunrise * 1000);
  var humidity = forecastList[0].humidity;
  var cloudiness = forecastList[0].clouds;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: GlobalVariables.getLanguage=='ru' ? 'Ветер: ' : 'Wind: '),
                TextSpan(text: '$windSpeed ${GlobalVariables.getLanguage=='ru' ? 'м/с' : 'm/s'}', style: TextStyle(color: Colors.white, fontSize: 18))
              ]
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: GlobalVariables.getLanguage=='ru' ? 'Восход: ' : 'Sunrise: '),
                TextSpan(text: '${sunrise.hour}', style: TextStyle(color: Colors.white, fontSize: 18))
              ]
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: GlobalVariables.getLanguage=='ru' ? 'Закат: ' : 'Sunset: '),
                TextSpan(text: '${sunset.hour}', style: TextStyle(color: Colors.white, fontSize: 18))
              ]
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: GlobalVariables.getLanguage=='ru' ? 'Влажность: ' : 'Humidity: '),
                TextSpan(text: '$humidity%', style: TextStyle(color: Colors.white, fontSize: 18))
              ]
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
              children: <TextSpan>[
                TextSpan(text:  GlobalVariables.getLanguage=='ru' ? 'Облачность:  ' :'Cloudiness: '),
                TextSpan(text: '$cloudiness%', style: TextStyle(color: Colors.white, fontSize: 18))
              ]
          ),
        )
      ],
    ),
  );
}