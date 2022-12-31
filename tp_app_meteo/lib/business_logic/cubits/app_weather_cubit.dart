import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_app_meteo/data/models/weather_model.dart';
import 'package:tp_app_meteo/data/repositories/weather_repository.dart';

part 'app_weather_state.dart';

class AppWeatherCubit extends Cubit<AppWeatherState> {
  final WeatherRepository weatherRepository = WeatherRepository();
  Future<WeatherForecastModel>? weatherModel;

  AppWeatherCubit() : super(AppWeatherInitial());

  void getWeather(String cityName) async {

    try {
      weatherModel = weatherRepository.getWeatherForecast(cityName: cityName);
      emit(AppWeatherLoaded());
      print('Ville trouvée.');

    }catch(error){
      print(error);
    }
  }
}
