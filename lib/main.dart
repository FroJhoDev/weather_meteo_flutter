import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/providers/placemark_provider.dart';
import 'src/providers/weather_provider.dart';

import 'src/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlacemarkProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
