// ignore_for_file: non_constant_identifier_names, unused_element, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';


class ThemeClass {
  Color bgsky = const Color(0xFFC1CCFC);
  Color bgnightsky = Color(0xFF28374D);
  Color bgbabypink = const Color(0xFFF2A49E);
  Color bgmaroon = const Color(0xFF880101);
  Color bgsunflower = const Color(0xFFFFDD79);
  Color bgburntorange = const Color(0xFFEA8C35);
  Color bgvampirepurple = const Color(0xFF492F6C);
  Color bgteal = const Color(0xFF9FF4A7);
  Color bgforestgreen = const Color(0xFF2D4D28);
  Color bgbrown = Color(0xFF623636);
  Color bglilac = const Color(0xFFCEB4F2);

  Color acWhite = const Color(0xFFFFFFFF);
  Color acbabypink = Color(0xFFE6B8B8);
  Color acDarkpurple = Color(0xFF361141);
  Color acDarkGray = const Color(0xFF888888);
  Color acPurple = Color(0xFF9D85BC);
  Color acYellow = const Color(0xFFFFDD79);
  Color acDark = const Color(0xFF282828);
  Color acDarker = const Color(0xFF3E3E3E);
  Color acBlue = Color(0xFF7D96B1);
  Color acGreen = Color(0xFFA6D79E);

  static profileTheme(Color backgroundColor, Color accentColor) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: ColorScheme.dark().copyWith(
        background: backgroundColor, // Background and elevated buttons text color
        onBackground: accentColor, // Elevated buttons background color
        primary: accentColor, // Text and dividers color
        onPrimary: backgroundColor, // Elevated buttons foreground color
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Spartan', color: accentColor),
        bodyText2: TextStyle(fontFamily: 'Spartan', color: accentColor),
        button: TextStyle(fontFamily: 'Spartan', color: accentColor),
        caption: TextStyle(fontFamily: 'Spartan', color: accentColor),
        headline4: TextStyle(fontFamily: 'Spartan', color: accentColor),
        headline5: TextStyle(fontFamily: 'Spartan', color: accentColor),
        headline6: TextStyle(fontFamily: 'Spartan', color: accentColor),
        subtitle1: TextStyle(fontFamily: 'Spartan', color: accentColor),
        subtitle2: TextStyle(fontFamily: 'Spartan', color: accentColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(accentColor), // Elevated buttons background color
          foregroundColor: MaterialStateProperty.all<Color>(backgroundColor), // Elevated buttons foreground color
        ),
      ),

      dividerTheme: DividerThemeData(
        color: accentColor, // Divider color
        thickness: 1, // Divider thickness
      ),
    );
  }

  static ThemeData feedTheme(Color backgroundColor, Color accentColor) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme: ColorScheme.dark().copyWith(
        background: accentColor, // Background and elevated buttons text color
        onBackground: backgroundColor, // Elevated buttons background color
        primary: backgroundColor, // Text and dividers color
        onPrimary: accentColor, // Elevated buttons foreground color
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        bodyText2: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        button: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        caption: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        headline4: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        headline5: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        headline6: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        subtitle1: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
        subtitle2: TextStyle(fontFamily: 'Spartan', color: backgroundColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor), // Elevated buttons background color
          foregroundColor: MaterialStateProperty.all<Color>(accentColor), // Elevated buttons foreground color
        ),
      ),
      dividerTheme: DividerThemeData(
        color: backgroundColor, // Divider color
        thickness: 1, // Divider thickness
      ),
    );
  }
}

