import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/api/weather_api.dart';
import 'package:my_weather/models/weather_forecast_daily.dart';
import 'package:my_weather/widgets/forecast_page/forecast_widget.dart';

class ForecastScreen extends StatefulWidget {
  final String _city;

  ForecastScreen(this._city);

  @override
  _ForecastScreenState createState() => _ForecastScreenState(_city);
}

class _ForecastScreenState extends State<ForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _city;
  BannerAd myBanner;

  _ForecastScreenState(this._city);

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8671215598915332~2450101657");
    myBanner = buildBannerAd()..load();
    if (_city != null) {
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: _city);
    } else {
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
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ForecastWidget(snapshot);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-8671215598915332/2938553794",
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print("&&&$event");
          if (event == MobileAdEvent.loaded) {
            myBanner..show(anchorType: AnchorType.bottom);
          }
        });
  }
}
