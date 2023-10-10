import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class SkyHomeComponent extends StatelessWidget {
  const SkyHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.3,
          child: Lottie.asset('assets/lottie/animation_cloud.json'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Lottie.asset(Provider.of<WeatherProvider>(context).weather.currentWeather.skyAnimation),
        ),
      ],
    );
  }
}
