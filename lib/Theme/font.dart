// lib/theme/theme.dart

import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: 'Arvo', // Set the global font family to Arvo
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontFamily: 'Arvo'),
    bodyMedium: TextStyle(fontFamily: 'Arvo'),
    displayLarge: TextStyle(fontFamily: 'Arvo'),
    displayMedium: TextStyle(fontFamily: 'Arvo'),
    displaySmall: TextStyle(fontFamily: 'Arvo'),
    headlineMedium: TextStyle(fontFamily: 'Arvo'),
    headlineSmall: TextStyle(fontFamily: 'Arvo'),
    titleLarge: TextStyle(fontFamily: 'Arvo'),
    titleMedium: TextStyle(fontFamily: 'Arvo'),
    titleSmall: TextStyle(fontFamily: 'Arvo'),
    bodySmall: TextStyle(fontFamily: 'Arvo'),
    labelLarge: TextStyle(fontFamily: 'Arvo'),
    labelSmall: TextStyle(fontFamily: 'Arvo'),
  ),
);
