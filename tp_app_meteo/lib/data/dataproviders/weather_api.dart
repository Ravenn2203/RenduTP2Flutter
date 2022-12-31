import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAPI{

  Future<Map<String, dynamic>> getRawWeather(String city) async{

    //Je reçois la réponse de ma requête HTTP GET
    final response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=" + city +
        "&appid=153694be11cabd8d9dd06871bdb27b5f"));

    if(response.statusCode == 200){

      //Je parse la réponse en un objet Map<String, dynamic>
      //jsonDecode prend un String JSON et retourne en un objet
      return jsonDecode(response.body);
    }else{
      print('coucou'+response.body.toString());
      throw Exception("Error getting weather forecast");
    }

  }

  /*Au démarrage je vais mettre la météo de Montpellier (si j'ai le temps)
  Future<Map<String, dynamic>> getRawWeatherForCurrentLocation() async{
    var rawWeather = "https: //api.openweathermap.org/data/2.5/forecast?q=" + 'Montpellier' +
        "&appid=153694be11cabd8d9dd06871bdb27b5f";
    return rawWeather;
  }*/

}