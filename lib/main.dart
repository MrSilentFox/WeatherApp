import 'package:flutter/material.dart';
import 'package:my_weather/view/initial_page/initial_page.dart';
import 'package:my_weather/view/initial_page/initial_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: MultiProvider(
        providers: [
            ChangeNotifierProvider<InitialPageProvider>.value(value: InitialPageProvider())
        ],
          child: InitCityScreen()
      ),
    );
  }
}