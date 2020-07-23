import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/utilities/date_util.dart';
import 'package:pit_slider_carousel/pit_slider_carousel.dart';

Widget sixDayForecast(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot){

  List<CarouselItem> list = [];

  for(int i=1; i <7; i++){
    list.add(CarouselItem(forecastCard(context, snapshot, i)));
  }

  CarouselController ctrl = CarouselController(carouselItems: list);

  return Container(
    height: 120,
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

Widget forecastCard(BuildContext context, AsyncSnapshot<WeatherForecast> snapshot, int index){
  var forecastList = snapshot.data.list;
  var date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormatDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var description = forecastList[index].weather[0].description;
  var minTemp = forecastList[index].temp.min.round();
  var maxTemp = forecastList[index].temp.max.round();

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('$dayOfWeek', style: TextStyle(color: Colors.white, fontSize: 25),),
        Text('$minTemp°-$maxTemp°', style: TextStyle(color: Colors.white, fontSize: 25),),
        Text('$description', style: TextStyle(color: Colors.white, fontSize: 25),),

      ],
    ),
  );
}


