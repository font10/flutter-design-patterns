import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/constants.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    surface: lightBackgroundColor,
  ),
  typography: Typography(
    englishLike: Typography.englishLike2018,
    dense: Typography.dense2018,
    tall: Typography.tall2018,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 34.0,
      color: Colors.black.withValues(alpha: 0.75),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24.0,
      color: Colors.black.withValues(alpha: 0.65),
    ),
    titleLarge: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 20.0,
      color: Colors.black.withValues(alpha: 0.65),
    ),
    titleMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      color: Colors.black.withValues(alpha: 0.65),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 14.0,
      color: Colors.black.withValues(alpha: 0.65),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.0,
      color: Colors.black.withValues(alpha: 0.65),
    ),
  ),
);
