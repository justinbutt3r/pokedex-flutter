import 'package:flutter/material.dart';

import 'text_theme.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.grey[200],
  primaryColor: Colors.white,
  backgroundColor: Colors.red,

  primaryColorLight: Colors.grey[500],
  primaryColorDark: Colors.black,

  toggleableActiveColor: Colors.black,

  indicatorColor: Colors.grey[500],

  // cardColor: Colors.white,
  textTheme: TextTheme(
    titleMedium: titleMedium.copyWith(
      color: Colors.white,
    ),
    headlineLarge: headlineLarge.copyWith(
      color: Colors.black,
    ),
    headlineMedium: headlineMedium.copyWith(
      color: Colors.black,
    ),
    bodyMedium: bodyMedium.copyWith(
      color: Colors.black,
    ),
    bodySmall: bodySmall.copyWith(
      color: Colors.black,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  ),
);
