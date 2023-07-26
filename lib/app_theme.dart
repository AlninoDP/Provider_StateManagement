import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      background: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.red[900]),
    colorScheme: const ColorScheme.dark(
        primary: Colors.black,
        onPrimary: Colors.red,
        secondary: Colors.black,
        onSecondary: Colors.red),
  );
}
