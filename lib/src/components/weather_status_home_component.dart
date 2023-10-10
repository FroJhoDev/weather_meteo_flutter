import 'package:flutter/material.dart';

class WeatherStatusHomeComponent extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;

  const WeatherStatusHomeComponent({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30.0),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white38)
        ),
      ],
    );
  }
}
