import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import '../utils/open_meteo_api_util.dart';

class WeatherRepository {


  Future<WeatherModel?> getWeatherForecast ({required Position currentPosition}) async {
    
    try {

      final response = await http.get(OpenMeteoApiUtil.weatherForecast(latitude: currentPosition.latitude, longitude: currentPosition.longitude));

      if (response.statusCode == 200) {

        return weatherModelFromJson(response.body);
        
      } else {
        throw(response.statusCode);
      }

    } catch (error, stack) {
      log('Erro na requisicao ao Open Meteo', error: error, stackTrace: stack);
      rethrow;
    }
    
  }


}