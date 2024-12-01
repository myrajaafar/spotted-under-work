import 'package:flutter/material.dart';

/// Convenience class to access application colors.
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Color(0xFF191D1F);

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color(0xFF191B1C);

  /// Color used for cards and surfaces.
  static const Color cardColor = Color(0xFF1F2426);

  /// Accent color used in the application.
  static const Color accentColor = Color(0xFFef8354);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    color: Color(0xFF1F2426),
    fontWeight: FontWeight.bold,
    fontFamily: 'Spartan',
    letterSpacing: 2,
  );

  static const TextStyle body = TextStyle(
    color: Color(0xFF1F2426),
    fontFamily: 'Spartan',
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static const TextStyle songTitle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'Spartan',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    shadows: [
      Shadow(
        color: Color.fromARGB(255, 0, 0, 0),
        offset: Offset(2, 2),
        blurRadius: 10,
      )
    ],
  );

  static const TextStyle artist = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'Spartan',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    decoration: TextDecoration.underline,
    decorationColor: Color.fromARGB(255, 255, 255, 255),
    decorationStyle: TextDecorationStyle.solid,
    shadows: [
      Shadow(
        color: Color.fromARGB(255, 0, 0, 0),
        offset: Offset(2, 2),
        blurRadius: 10,
      )
    ],
  );
}
