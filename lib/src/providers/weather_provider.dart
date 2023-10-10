import 'package:flutter/material.dart';

import '../theme/app_color_schemes.dart';

import '../models/weather_model.dart';
import '../repositories/location_repository.dart';
import '../repositories/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository();
  final WeatherRepository _weatherRepository = WeatherRepository();
  late WeatherModel _weather;

  WeatherModel get weather => _weather;

  set weather(WeatherModel weatherModel) {
    _weather = weatherModel;
    notifyListeners();
  }

  bool _isLoading = true; 

  bool get isLoading => _isLoading;

  set isLoading (bool loadingInformations) {
    _isLoading = loadingInformations;
    notifyListeners();
  }

  MaterialColor _weatherColor = AppColorSchemes.dayColor;

  MaterialColor get weatherColor => _weatherColor;

  set weatherColor (MaterialColor color) {
    _weatherColor = color;
    notifyListeners();
  }

  Future<void> getWeatherForecastByLocation() async {

    isLoading = true;
    
    final currentWeather = await _weatherRepository.getWeatherForecast(
      currentPosition: await _locationRepository.getDeviceCurrentPosition(),
    );

    if (currentWeather != null) {
      weather = currentWeather;
      weatherColor = weather.currentWeather.isDay == 1 ? AppColorSchemes.dayColor : AppColorSchemes.nightColor;
      isLoading = false;
    }

  }
}
