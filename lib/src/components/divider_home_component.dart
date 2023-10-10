import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class DividerHomeComponent extends StatelessWidget {
  const DividerHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Divider(
        color: Provider.of<WeatherProvider>(context).weatherColor.shade300,
        height: 20.0,
      ),
    );
  }
}
