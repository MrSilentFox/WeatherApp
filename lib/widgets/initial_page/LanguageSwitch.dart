import 'package:flutter/material.dart';
import 'package:my_weather/view/initial_page/initial_page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSwitch extends StatelessWidget{

  InitialPageProvider state;

  LanguageSwitch(this.state);

  @override
  Widget build(BuildContext context) {
    getLanguageBool(state);
    return Column(
      children: [
        SizedBox(height: 3,),
        Text("eng/rus", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15)),
        Switch(
          value: state.getLanguage == "ru",
          onChanged: (bool){
            if(bool){
              state.setLanguage("ru");
              setLenguage("ru");
            }else{
              state.setLanguage("en");
              setLenguage("en");
            }
          },
        )
      ],
    );
  }

  void getLanguageBool(InitialPageProvider state) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("language")??"ru";
    state.setLanguage(lang);
  }

  void setLenguage(String lang) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", lang);
  }
}