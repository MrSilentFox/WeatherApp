import 'package:flutter/material.dart';
import 'package:my_weather/models/current_forecast.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/widgets/forecast_page/city_block.dart';
import 'package:my_weather/widgets/forecast_page/info_widget.dart';
import 'package:my_weather/widgets/forecast_page/weather_image_widget.dart';

class ForecastWidget extends StatefulWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;
  ForecastWidget(this.snapshot);

  @override
  _ForecastWidgetState createState() => _ForecastWidgetState(snapshot);
}

class _ForecastWidgetState extends State<ForecastWidget> {

  AsyncSnapshot<WeatherForecast> snapshot;
  _ForecastWidgetState(this.snapshot);

  CurrentForecast currentForecast;
  int currentDay;

  @override
  void initState() {
    currentDay = 0;
    currentForecast = LoadCurrentForecast.getCurrentForecast(snapshot, currentDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        weatherImage(currentForecast),
        Column(
          children: <Widget>[
            SizedBox(height: 200,),
            cityBlock(context, currentForecast),
            forecastCardList(),
            infoWidget(currentForecast)
          ],
        )
      ],
    );
  }

  Widget forecastCard(int index, AsyncSnapshot<WeatherForecast> snapshot){
    CurrentForecast forecast = LoadCurrentForecast.getCurrentForecast(snapshot, index);
    return Expanded(
      child: Container(
        color: currentDay == index ? Colors.white : Colors.transparent,
        height: 70,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.cloud_queue, color: currentDay == index ? Colors.black : Colors.white,),
              Text('${forecast.temperature}°', style: TextStyle(color: currentDay == index ? Colors.black : Colors.white),),
              Text(forecast.day, style: TextStyle(color: currentDay == index ? Colors.black : Colors.white, fontSize: 12),),
            ],
          ),
          onTap: (){
            setState(() {
              currentForecast = forecast;
              currentDay = index;
            });
          },
        ),
      ),
    );
  }

  Widget forecastCardList(){
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Row(
          children: <Widget>[
            SizedBox(width: 5,),
            forecastCard(0, snapshot),
            forecastCard(1, snapshot),
            forecastCard(2, snapshot),
            forecastCard(3, snapshot),
            forecastCard(4, snapshot),
            SizedBox(width: 5,),
          ],
        ),
      ],
    );
  }
}
