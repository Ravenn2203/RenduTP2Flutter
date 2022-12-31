import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  Widget getWeatherIcon(
      {required String weatherDescription, required double size}) {
    if (weatherDescription.contains('clear')) {
      return Icon(
        FontAwesomeIcons.sun,
        color: Colors.yellow,
        size: size,
      );
    } else if (weatherDescription.contains('clouds')) {
      return Icon(FontAwesomeIcons.cloud, color: Colors.grey, size: size);
    } else if (weatherDescription.contains('rain')) {
      return Icon(
        FontAwesomeIcons.cloudRain,
        color: Colors.grey,
        size: size,
      );
    } else if (weatherDescription.contains('snow')) {
      return Icon(
        FontAwesomeIcons.snowman,
        color: Colors.white,
        size: size,
      );
    } else {
      return Icon(
        FontAwesomeIcons.sun,
        color: Colors.yellow,
        size: size,
      );
    }
  }
}
