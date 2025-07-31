import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color.fromARGB(255, 221, 247, 224),
  cardColor: const Color.fromARGB(255, 232, 241, 231),
  primaryColor: Color.fromARGB(255, 178, 215, 183),
  highlightColor: Color.fromARGB(255, 127, 163, 152),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color(0xFF0A2342),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 45, 76, 60),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(150, 32, 121, 69),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
