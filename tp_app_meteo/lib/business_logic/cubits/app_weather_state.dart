part of 'app_weather_cubit.dart';

@immutable
abstract class AppWeatherState {
  get weatherForecastModel => null;
}

class AppWeatherInitial extends AppWeatherState {}

class AppWeatherLoading extends AppWeatherState {}

class AppWeatherLoaded extends AppWeatherState {}

class AppWeatherError extends AppWeatherState {}