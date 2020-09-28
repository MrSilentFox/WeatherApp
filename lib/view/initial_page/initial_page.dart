import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/utilities/global_variables.dart';
import 'package:my_weather/view/initial_page/initial_page_provider.dart';
import 'package:my_weather/widgets/initial_page/LabelWidget.dart';
import 'package:my_weather/widgets/initial_page/LanguageSwitch.dart';
import 'package:my_weather/widgets/initial_page/button_bar.dart';
import 'package:provider/provider.dart';

class InitCityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    InitialPageProvider _state = Provider.of<InitialPageProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalVariables.getMainColor,
      body: SafeArea(
        child: Stack(children: <Widget>[
          FlareActor('assets/animations/moon_to_sun.flr',
              alignment: Alignment.center, fit: BoxFit.cover, animation: 'run'),
          Center(
            child: Column(
              children: <Widget>[
                LabelWidget(),
                searchField(_state),
                ButtonsBar(_state),
                LanguageSwitch(_state)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget searchField(InitialPageProvider _state) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: GlobalVariables.getLanguage == 'ru' ? 'Введите город' : 'Enter city',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent)),
            ),
            controller: _state.getTextController(),
            onChanged: (value) {
              _state.setCity(value);
            },
          ),
        ),
      ],
    );
  }
}
