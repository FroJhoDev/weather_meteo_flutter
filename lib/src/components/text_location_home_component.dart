import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/placemark_provider.dart';

class TextLocationHomeComponent extends StatelessWidget {
  const TextLocationHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on_outlined),
        const SizedBox(width: 5.0),
        Text(
          '${Provider.of<PlacemarkProvider>(context).currentAddress.subAdministrativeArea ?? ''} - ${Provider.of<PlacemarkProvider>(context).currentAddress.administrativeArea ?? ''}',
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    );
  }
}
