import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingHomeComponent extends StatelessWidget {
  const LoadingHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/animation_loader.json',
              fit: BoxFit.contain),
          Text(
            'Carregando Informações...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.blue[100],
                ),
          )
        ],
      ),
    );
  }
}
