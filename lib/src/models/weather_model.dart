import 'dart:convert';

import '../utils/sky_animations_assets_utils.dart';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeatherUnits currentWeatherUnits;
  final CurrentWeather currentWeather;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeatherUnits:
            CurrentWeatherUnits.fromJson(json["current_weather_units"]),
        currentWeather: CurrentWeather.fromJson(json["current_weather"]),
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather_units": currentWeatherUnits.toJson(),
        "current_weather": currentWeather.toJson(),
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
      };

  @override
  String toString() {
    return 'WeatherModel(latitude: $latitude, longitude: $longitude, generationtimeMs: $generationtimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, elevation: $elevation, currentWeatherUnits: $currentWeatherUnits, currentWeather: $currentWeather, dailyUnits: $dailyUnits, daily: $daily)';
  }
}

class CurrentWeather {
  final String time;
  final double temperature;
  final double windspeed;
  final int winddirection;
  final int isDay;
  final int weathercode;

  CurrentWeather({
    required this.time,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        time: json["time"],
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"],
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
      };

  String get interpretation {
    switch (weathercode) {
      case 0:
        return "Céu Limpo";
      case 1:
        return 'Predominantemente Claro';
      case 2:
        return 'Parcialmente Nublado';
      case 3:
        return "Céu Nublado";
      case 45:
        return "Neblina";
      case 48:
        return "Neblina com Formação Gelo";
      case 51:
        return "Garoa Fraca";
      case 53:
        return "Garoa Moderada";
      case 55:
        return "Garoa Intensa";
      case 56:
        return "Garoa Congelante Fraca";
      case 57:
        return "Garoa Congelante Intensa";
      case 61:
        return "Chuva Fraca";
      case 63:
        return "Chuva Moderada";
      case 65:
        return "Chuva Intensa";
      case 66:
        return "Chuva Congelante Fraca";
      case 67:
        return "Chuva Congelante Intensa";
      case 71:
        return "Queda de Neve Fraca";
      case 73:
        return "Queda de Neve Moderada";
      case 75:
        return "Queda de Neve Intensa";
      case 77:
        return "Grãos de Neve";
      case 80:
        return "Pancadas de Chuva Fraca";
      case 81:
        return "Pancadas de Chuva Moderada";
      case 82:
        return "Pancadas de Chuva Forte";
      case 85:
        return "Pancadas de Neve Fraca";
      case 86:
        return "Pancadas de Neve Intensa";
      case 95:
        return "Tempestade";
      case 96:
        return "Tempestade com Granizo Fraco";
      case 99:
        return "Tempestade com Granizo Forte";
      default:
        return "Código não reconhecido";
    }
  }

  String get skyAnimation {
    switch (weathercode) {
      case 0:
      case 1:
        return SkyAnimationsAssetsUtils.clearSky[isDay];
      case 2:
        return SkyAnimationsAssetsUtils.mainlyClear[isDay];
      case 3:
        return SkyAnimationsAssetsUtils.overcast[0];
      case 45:
        return SkyAnimationsAssetsUtils.fog[0];
      case 48:
        return SkyAnimationsAssetsUtils.fog[0];
      case 51:
      case 53:
      case 55:
        return SkyAnimationsAssetsUtils.rain[isDay];
      case 56:
      case 57:
        return SkyAnimationsAssetsUtils.snowFall[isDay];
      case 61:
      case 63:
      case 65:
        return SkyAnimationsAssetsUtils.rain[isDay];
      case 66:
      case 67:
      case 71:
      case 73:
      case 75:
      case 77:
        return SkyAnimationsAssetsUtils.snowFall[isDay];
      case 80:
      case 81:
      case 82:
        return SkyAnimationsAssetsUtils.rainShowers[isDay];
      case 85:
      case 86:
        return SkyAnimationsAssetsUtils.snowFall[isDay];
      case 95:
        return SkyAnimationsAssetsUtils.rainShowers[isDay];
      case 96:
      case 99:
        return SkyAnimationsAssetsUtils.snowFall[isDay];
      default:
        return SkyAnimationsAssetsUtils.clearSky[isDay];
    }
  }
}

class CurrentWeatherUnits {
  final String time;
  final String temperature;
  final String windspeed;
  final String winddirection;
  final String isDay;
  final String weathercode;

  CurrentWeatherUnits({
    required this.time,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherUnits(
        time: json["time"],
        temperature: json["temperature"],
        windspeed: json["windspeed"],
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
      };
}

class Daily {
  final List<DateTime> time;
  final List<double> apparentTemperatureMax;
  final List<int> precipitationProbabilityMax;

  Daily({
    required this.time,
    required this.apparentTemperatureMax,
    required this.precipitationProbabilityMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        apparentTemperatureMax: List<double>.from(
            json["apparent_temperature_max"].map((x) => x?.toDouble())),
        precipitationProbabilityMax:
            List<int>.from(json["precipitation_probability_max"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "apparent_temperature_max":
            List<dynamic>.from(apparentTemperatureMax.map((x) => x)),
        "precipitation_probability_max":
            List<dynamic>.from(precipitationProbabilityMax.map((x) => x)),
      };
}

class DailyUnits {
  final String time;
  final String apparentTemperatureMax;
  final String precipitationProbabilityMax;

  DailyUnits({
    required this.time,
    required this.apparentTemperatureMax,
    required this.precipitationProbabilityMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        apparentTemperatureMax: json["apparent_temperature_max"],
        precipitationProbabilityMax: json["precipitation_probability_max"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "apparent_temperature_max": apparentTemperatureMax,
        "precipitation_probability_max": precipitationProbabilityMax,
      };
}
