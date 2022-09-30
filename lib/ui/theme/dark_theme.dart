import 'package:flutter/material.dart';
import 'text_theme.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey[900],
  backgroundColor: Colors.grey[800],

  primaryColorLight: Colors.grey[500],
  primaryColorDark: Colors.black,

  indicatorColor: Colors.black,

  toggleableActiveColor: Colors.white,
  // cardColor: Colors.white,
  textTheme: TextTheme(
    titleMedium: titleMedium.copyWith(
      color: Colors.white,
    ),
    headlineLarge: headlineLarge.copyWith(
      color: Colors.white,
    ),
    headlineMedium: headlineMedium.copyWith(
      color: Colors.white,
    ),
    bodyMedium: bodyMedium.copyWith(
      color: Colors.white,
    ),
    bodySmall: bodySmall.copyWith(
      color: Colors.white,
    ),
    labelMedium: labelMedium.copyWith(
      color: Colors.white,
    ),
    labelSmall: labelSmall.copyWith(
      color: Colors.white,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  ),
);
