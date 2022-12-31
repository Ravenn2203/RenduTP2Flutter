import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp_app_meteo/utils/utils.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/weather_model.dart';

class Previsions extends StatefulWidget {
  int journee;
  final WeatherForecastModel? modele;

  Previsions({required this.journee, required this.modele});

  @override
  State<Previsions> createState() => _PrevisionsState();
}

class _PrevisionsState extends State<Previsions> {

  @override
  Widget build(BuildContext context) {
    int journee = widget.journee;
    WeatherForecastModel? modele = widget.modele;

    return Container(margin: const EdgeInsets.only(top: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(children: [
            Text(_getDatePrevisions(modele!, journee),
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 15.0,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.white,
                child: Utils().getWeatherIcon(
                    weatherDescription: _getDescription(modele, journee),
                    size: 40),
              ),
              _getPetitesInfos(modele, journee),
            ],
          )
        ]),
      ),
    );
  }

  Column _getPetitesInfos(WeatherForecastModel modele, int jour) {
    return Column(
      children: [
        Row(
          children: [
            Text(_getMaxTemp(modele, jour),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
            Icon(Icons.arrow_upward, color: Colors.black, size: 20),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(_getMinTemp(modele, jour),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
            Icon(Icons.arrow_downward, color: Colors.black, size: 20),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text('Hum: ',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
            Text(_getHumidity(modele, jour),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text('Wind: ',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
            Text(_getWindSpeed(modele, jour),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                )),
          ],
        ),
      ],
    );
  }

  String _getDatePrevisions(WeatherForecastModel modele, int jour){
    String date = modele.liste?.elementAt(jour).dtTxt ?? "";
    DateTime datee = DateTime.parse(date);
    DateFormat dateFormat = DateFormat("dd MM yyyy");
    String formattedDate = dateFormat.format(datee);
    return formattedDate;
  }

  String _getMaxTemp(WeatherForecastModel modele, int jour){
    double celcius = modele.liste?.elementAt(jour).main?.tempMax ?? 0;
    celcius = celcius - 273.15;
    String temperature = celcius.toStringAsFixed(1);
    return temperature + "°C";
  }

  String _getMinTemp(WeatherForecastModel modele, int jour){
    double celcius = modele.liste?.elementAt(jour).main?.tempMin ?? 0;
    celcius = celcius - 273.15;
    String temperature = celcius.toStringAsFixed(1);
    return temperature + "°C";
  }

  String _getHumidity(WeatherForecastModel modele, int jour) {
    int humidity = modele?.liste?.elementAt(jour).main?.humidity ?? 0;
    String humidityy = humidity.toStringAsFixed(1);
    return humidityy + "%";
  }

  String _getWindSpeed(WeatherForecastModel modele, int jour) {
    int wind = modele?.liste?.elementAt(jour).wind?.speed ?? 0;
    String wiind = wind.toStringAsFixed(1);
    return wiind + "m/s";
  }

  String _getDescription(WeatherForecastModel modele, int jour) {
    Object description = modele?.liste
        ?.elementAt(jour)
        .weather
        ?.elementAt(0)
        .description
        .toString() ??
        0;
    return description.toString();
  }

}
