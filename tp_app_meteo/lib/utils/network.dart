

import 'dart:convert';

import 'package:http/http.dart';
import 'package:tp_app_meteo/data/models/weather_model.dart';

class Network{

  static Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async{
    print('Je suis dans la classe Network');
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid=a04d4f3230f373b71e8237e6b76cfe26";

    final response = await get(Uri.parse(finalUrl));
    //print("URL : ${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200){
      //print("weather data : ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));

    }else{
      throw Exception("Error getting weather forecast");
    }
  }
}