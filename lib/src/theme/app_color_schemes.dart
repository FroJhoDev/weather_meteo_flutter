import 'package:flutter/material.dart';

class AppColorSchemes {
  
  static const int _primaryDayValue = 0xFF3aafde;

  static const MaterialColor dayColor = MaterialColor(
    _primaryDayValue,
    <int, Color>{
      50: Color(0xFFe9f6fb),
      100: Color(0xFFbde4f4),
      200: Color(0xFF92d2ed),
      300: Color(0xFF92d2ed),
      400: Color(0xFF87CEEB),
      500: Color(_primaryDayValue),
      600: Color(0xFF1a7499),
      700: Color(0xFF12536d),
      800: Color(0xFF0b3242),
      900: Color(0xFF082632),
    },
  );

  static const int _primaryNightValue = 0xFF614cbf;

  static const MaterialColor nightColor = MaterialColor(
    _primaryNightValue,
    <int, Color>{
      50: Color(0xFFeeecf8),
      100: Color(0xFFcdc7eb),
      200: Color(0xFFaca1dd),
      300: Color(0xFF8b7cd0),
      400: Color(0xFF6a56c3),
      500: Color(_primaryNightValue),
      600: Color(0xFF503ca9),
      700: Color(0xFF3e2f83),
      800: Color(0xFF2d225e),
      900: Color(0xFF1b1438),
    },
  );


}
