import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/utilities/global_variables.dart';
import 'package:my_weather/view/forecast_page/forecast_page.dart';
import 'package:my_weather/view/initial_page/initial_page_provider.dart';
import 'package:my_weather/widgets/initial_page/underline_widget.dart';
import 'package:provider/provider.dart';

class InitCityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    InitialPageProvider _state = Provider.of<InitialPageProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: GlobalVariables.getMainColor,
          child: ListView(
            children: <Widget>[
              Container(
                height: 100,
                child: Center(
                    child: Text(GlobalVariables.getLanguage=='ru' ? 'Настройки' : 'Settings', style: TextStyle(color: GlobalVariables.getTextColor, fontSize: 30), ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(GlobalVariables.getLanguage=='ru' ? 'Язык' : 'Language',style: TextStyle(color: GlobalVariables.getTextColor, fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton(
                  style: TextStyle(color: GlobalVariables.getTextColor,),
                  dropdownColor: GlobalVariables.getMainColor,
                  items: [
                      DropdownMenuItem(child: Text('русский'), value: 'ru',),
                      DropdownMenuItem(child: Text('english'), value: 'en',)
                    ],
                  onChanged: (newValue){_state.setLanguage(newValue);},
                  value: _state.getLanguage,
                  ),
              ),
            ],
          ),
        )
      ),
      backgroundColor: GlobalVariables.getMainColor,
      body: SafeArea(
        child: Stack(
            children: <Widget>[
              FlareActor('assets/moon_to_sun.flr', alignment:Alignment.center, fit:BoxFit.cover, animation:'run'),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 200,),
                    Text('Weather App',style: TextStyle(color: Colors.white, fontSize: 40),),
                    SizedBox(height: 30,),
                    DropdownButton(
                      underline: underLine(),
                      style: TextStyle(color: GlobalVariables.getTextColor,),
                      dropdownColor: GlobalVariables.getMainColor,
                      hint: Text(GlobalVariables.getLanguage=='ru' ? 'ВЫБЕРЕТЕ ГОРОД' : 'SELECT CITY', style: TextStyle(color: GlobalVariables.getTextColor.withOpacity(0.4), fontWeight: FontWeight.bold),),
                      value: _state.getCity,
                      onChanged: (newValue){
                        _state.setCity(newValue);
                      },
                      items: GlobalVariables.cityList.map((city){
                        return DropdownMenuItem(
                          child: Text('${city.rusName} - ${city.enName}'),
                          value: city.enName,
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: RaisedButton(
                        color: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.tealAccent,
                        child: Text(GlobalVariables.getLanguage=='ru' ? 'Прогноз по городу' : 'Forecast from city', style:  TextStyle(color:  Colors.white, fontSize: 20),),
                        onPressed: (){
                          if(_state.getCity!=null){
                            Route route = MaterialPageRoute(builder: (context) => ForecastScreen(_state.getCity));
                            Navigator.push(context, route);
                          }
                        },
                      ),
                    ),
                    Text('or',style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: RaisedButton(
                        color: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.tealAccent,
                        child: Text(GlobalVariables.getLanguage=='ru' ? 'Прогноз по локации' : 'Forecast from location', style:  TextStyle(color:  Colors.white, fontSize: 20)),
                        onPressed: (){
                          Route route = MaterialPageRoute(builder: (context) => ForecastScreen(null));
                          Navigator.push(context, route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
