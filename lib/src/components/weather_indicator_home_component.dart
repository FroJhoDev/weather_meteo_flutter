import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class WeatherIndicatorHomeComponent extends StatelessWidget {
  const WeatherIndicatorHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Provider.of<WeatherProvider>(context).weather.currentWeather.temperature.toString(),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '∘',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.08,
                color: Colors.white38,
              ),
            ),
          ],
        ),
        Text(
          Provider.of<WeatherProvider>(context).weather.currentWeather.interpretation,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
