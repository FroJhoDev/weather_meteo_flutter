import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class LightContainerHomeComponent extends StatelessWidget {
  final List<Widget> content;

  const LightContainerHomeComponent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final weatherColor = Provider.of<WeatherProvider>(context).weatherColor;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.93,
            height: MediaQuery.of(context).size.height * 0.865,
            decoration: BoxDecoration(
              color: weatherColor.shade600,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80.0),
                bottomRight: Radius.circular(80.0),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(90.0),
                colors: [
                  weatherColor.shade400,
                  weatherColor.shade500,
                ]),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80.0),
                bottomRight: Radius.circular(80.0)),
            border: Border.all(color: weatherColor.shade300),
            boxShadow: [
              BoxShadow(
                  color: weatherColor.withOpacity(0.15),
                  blurRadius: 5.0,
                  spreadRadius: 2.0),
              BoxShadow(color: weatherColor.withOpacity(0.20), blurRadius: 5.0),
              BoxShadow(
                  color: weatherColor.withOpacity(0.30),
                  blurRadius: 60.0,
                  spreadRadius: 20.0),
              BoxShadow(
                  color: weatherColor.withOpacity(0.60), blurRadius: 15.0),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: content,
            ),
          ),
        ),
      ],
    );
  }
}
