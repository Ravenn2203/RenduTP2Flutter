import 'dart:convert';
import 'package:http/http.dart';
import '../models/weather_model.dart';
import '../dataproviders/weather_api.dart';

class WeatherRepository {

  //Dépendance vers la source
  final WeatherAPI weatherAPI = WeatherAPI();

  //On utilise le widget Future comme type de retour car c'est une fonction asynchrone qui retournera les résultats quand elle les aura obtenu (depuis l'API)
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    Map<String, dynamic> data = await weatherAPI.getRawWeather(cityName);
    final WeatherForecastModel weather = WeatherForecastModel.fromJson(data);

    return weather;

  }
}
