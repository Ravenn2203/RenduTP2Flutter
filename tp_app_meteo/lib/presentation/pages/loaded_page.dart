import 'package:flutter/material.dart';
import 'package:tp_app_meteo/data/models/weather_model.dart';
import 'package:tp_app_meteo/presentation/widgets/previsions_card.dart';
import 'package:tp_app_meteo/utils/utils.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LoadedPage extends StatefulWidget {
  //const LoadedPage({Key? key}) : super(key: key);

  final WeatherForecastModel? model;

  LoadedPage({required this.model});

  @override
  State<LoadedPage> createState() => _LoadedPageState(modele: model);
}

class _LoadedPageState extends State<LoadedPage> {
  final WeatherForecastModel? modele;

  _LoadedPageState({required this.modele});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _getCurrentMeteoPart(),
          SizedBox(
            height: 10,
          ),
          _getTextPrevisions(),
          _previsionCards(),
        ],
      ),
    );
  }

  Card _getCurrentMeteoPart() {
    // Récupère la date et l'heure courantes
    DateTime now = DateTime.now();
    // Crée un objet de formatage de date
    final DateFormat dateFormat = DateFormat("EEEE, MMMM d, yyyy");
    // Formate la date courante
    final String formattedDate = dateFormat.format(now);

    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Text(modele?.city?.name ?? "",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 2),
            Text(formattedDate,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 16.0,
                )),
            const SizedBox(height: 5),
            Utils().getWeatherIcon(
                weatherDescription: _getDescription(0), size: 170),
            const SizedBox(height: 10),
            _getTemperatureAndDescription(),
            const SizedBox(height: 10),
            _getVentAndPrecipitationsAndTemperature(),
          ],
        ),
      ),
    );
  }

  Padding _getTemperatureAndDescription() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Row(
          children: [
            Text(_getTemperatureIntoCelcius(0),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(width: 15),
            Text(_getDescription(0),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 16.0,
                )),
          ],
        ));
  }

  Row _getVentAndPrecipitationsAndTemperature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(_getWindSpeed(0),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                )),
            Icon(Icons.wind_power, color: Colors.black, size: 30),
          ],
        ),
        SizedBox(width: 15),
        Column(
          children: [
            Text(_getHumidity(0),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                )),
            Icon(Icons.water_drop_outlined, color: Colors.black, size: 30),
          ],
        ),
        SizedBox(width: 15),
        Column(
          children: [
            Text(_getTemperatureIntoCelcius(0),
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                )),
            Icon(Icons.thermostat, color: Colors.black, size: 30),
          ],
        ),
      ],
    );
  }

  Center _getTextPrevisions() {
    return Center(
      child: Text('PREVISIONS SUR 4 JOURS',
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 13.0,
              fontWeight: FontWeight.w600)),
    );
  }

  SingleChildScrollView _previsionCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Previsions(journee: 0, modele: modele),
          Previsions(journee: 8, modele: modele),
          Previsions(journee: 16, modele: modele),
          Previsions(journee: 24, modele: modele),
        ],
      ),
    );
  }

  String _getTemperatureIntoCelcius(int jour) {
    double celcius = modele?.liste?.elementAt(jour).main?.temp ?? 0;
    celcius = celcius - 273.15;
    String temperature = celcius.toStringAsFixed(1);
    return temperature + "°C";
  }

  String _getWindSpeed(int jour) {
    int wind = modele?.liste?.elementAt(jour).wind?.speed ?? 0;
    String wiind = wind.toStringAsFixed(1);
    return wiind + "m/s";
  }

  String _getHumidity(int jour) {
    //print(modele?.liste?.elementAt(0).dtTxt);
    int humidity = modele?.liste?.elementAt(jour).main?.humidity ?? 0;
    String humidityy = humidity.toStringAsFixed(1);
    return humidityy + "%";
  }

  String _getDescription(int jour) {
    Object description = modele?.liste
            ?.elementAt(jour)
            .weather
            ?.elementAt(jour)
            .description
            .toString() ??
        0;
    return description.toString();
  }
}
