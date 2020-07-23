import 'package:flutter/material.dart';
import 'package:my_weather/api/weather_api.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/widgets/forecast_page/info_widget.dart';
import 'package:my_weather/widgets/forecast_page/six_day_forecast_widget.dart';
import 'package:my_weather/widgets/forecast_page/weather_image_widget.dart';

class ForecastScreen extends StatefulWidget {
  final String _city;

  ForecastScreen(this._city);

  @override
  _ForecastScreenState createState() => _ForecastScreenState(_city);
}

class _ForecastScreenState extends State<ForecastScreen> {

  Future<WeatherForecast> forecastObject;
  String _city;

  _ForecastScreenState(this._city);

  @override
  void initState() {
    super.initState();
    if(_city != null){
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: _city);
    }else{
      forecastObject = WeatherApi().fetchWeatherForecastFromLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 41, 44, 1),
      body: SafeArea(
          child: FutureBuilder(
            future: forecastObject,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    weatherImage(context, snapshot),
                    infoWidget(context, snapshot),
                    SizedBox(height: 80,),
                    sixDayForecast(context, snapshot)
                  ],
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          )
      ),
    );
  }
}
