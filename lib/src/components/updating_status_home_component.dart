import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class UpdatingStatusHomeComponent extends StatelessWidget {
  const UpdatingStatusHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<WeatherProvider>(context, listen: false).getWeatherForecastByLocation(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.change_circle_rounded,
              color: Colors.white,
              size: 15.0,
            ),
            const SizedBox(width: 5.0),
            Text(
              'Atualizar',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
