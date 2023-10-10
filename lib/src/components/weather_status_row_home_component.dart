import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import 'weather_status_home_component.dart';

class WeatherStatusRowHomeComponent extends StatelessWidget {
  const WeatherStatusRowHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherStatusHomeComponent(
          icon: Icons.air_outlined,
          value: '${Provider.of<WeatherProvider>(context).weather.currentWeather.windspeed.toString()} km/h',
          title: 'Vento',
        ),
        WeatherStatusHomeComponent(
          icon: Icons.thermostat_outlined,
          value: '${Provider.of<WeatherProvider>(context).weather.daily.apparentTemperatureMax[0].toString()} ∘',
          title: 'Sensação Térmica',
        ),
        WeatherStatusHomeComponent(
          icon: Icons.thunderstorm_outlined,
          value: '${Provider.of<WeatherProvider>(context).weather.daily.precipitationProbabilityMax[0].toString()} %',
          title: 'Chuva',
        ),
      ],
    );
  }
}
