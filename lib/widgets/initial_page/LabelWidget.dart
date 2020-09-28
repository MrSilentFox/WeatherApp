import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ],
    );
  }
}