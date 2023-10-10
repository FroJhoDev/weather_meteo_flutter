import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_meteo/src/extensions/date_format_extension.dart';

import '../providers/weather_provider.dart';

class DateInformationsHomeComponent extends StatelessWidget {
  const DateInformationsHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<WeatherProvider>(context).weather.currentWeather.time.formattedDate,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Colors.white38),
    );
  }
}
