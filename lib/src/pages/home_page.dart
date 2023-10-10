import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

import '../components/sky_home_component.dart';
import '../components/divider_home_component.dart';
import '../components/loading_home_component.dart';
import '../components/text_location_home_component.dart';
import '../components/updating_status_home_component.dart';
import '../components/light_container_home_component.dart';
import '../components/date_informations_home_component.dart';
import '../components/weather_indicator_home_component.dart';
import '../components/weather_status_row_home_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherProvider _weatherProvider = WeatherProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
      await _weatherProvider.getWeatherForecastByLocation();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 31, 56),
      body: Consumer<WeatherProvider>(
        builder: (_, forecast, __) => forecast.isLoading
            ? const LoadingHomeComponent()
            : const LightContainerHomeComponent(
                content: [
                  TextLocationHomeComponent(),
                  SizedBox(height: 10),
                  UpdatingStatusHomeComponent(),
                  SkyHomeComponent(),
                  WeatherIndicatorHomeComponent(),
                  DateInformationsHomeComponent(),
                  DividerHomeComponent(),
                  WeatherStatusRowHomeComponent(),
                ],
              ),
      ),
    );
  }
}
