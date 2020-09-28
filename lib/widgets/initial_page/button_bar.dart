import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/utilities/global_variables.dart';
import 'package:my_weather/view/forecast_page/forecast_page.dart';
import 'package:my_weather/view/initial_page/initial_page_provider.dart';
import 'package:toast/toast.dart';

class ButtonsBar extends StatelessWidget{

  InitialPageProvider _state;

  ButtonsBar(this._state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.tealAccent,
              elevation: 0,
              child: Center(
                child: Text(GlobalVariables.getLanguage == 'ru'
                    ? 'ПО ГОРОДУ'
                    : 'FROM CITY',
                  style: TextStyle(color: Colors.black, fontSize: 20),),
              ),
              onPressed: (){
                if (_state.getCity != null) {
                  Route route = MaterialPageRoute(
                      builder: (context) => ForecastScreen(_state.getCity.trimRight()));
                  Navigator.push(context, route);
                }else{
                  Toast.show(GlobalVariables.getLanguage == 'ru'
                      ? 'Введите город!'
                      : 'Enter city!',context,duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                }
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.tealAccent,
              elevation: 0,
              child: Center(
                child: Text(GlobalVariables.getLanguage == 'ru'
                    ? 'ПО ЛОКАЦИИ'
                    : 'FROM LOCATION',
                  style: TextStyle(color: Colors.black, fontSize: 20),),
              ),
              onPressed: (){
                Route route =
                MaterialPageRoute(builder: (context) => ForecastScreen(null));
                Navigator.push(context, route);
              },
            ),
          ),
        ),
        /*Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            elevation: 0,
            color: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.tealAccent,
            child: Text(
              GlobalVariables.getLanguage == 'ru'
                  ? 'ПО ГОРОДУ'
                  : 'FROM CITY',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              if (_state.getCity != null) {
                Route route = MaterialPageRoute(
                    builder: (context) => ForecastScreen(_state.getCity.trimRight()));
                Navigator.push(context, route);
              }
            },
          ),
        ),
        Text("- or -", style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 20),),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            elevation: 0,
            color: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.tealAccent,
            child: Text(
                GlobalVariables.getLanguage == 'ru'
                    ? 'ПО ЛОКАЦИИ'
                    : 'FROM LOCATION',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              Route route =
              MaterialPageRoute(builder: (context) => ForecastScreen(null));
              Navigator.push(context, route);
            },
          ),
        ),*/
      ],
    );
  }
}