import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black),
    colorScheme: ColorScheme.light(
      primary: Colors.blue[900]!,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      background: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.blueGrey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blueGrey, selectedItemColor: Colors.white),
    scaffoldBackgroundColor: Colors.blueGrey[700],
    colorScheme: const ColorScheme.dark(
        primary: Colors.blueGrey,
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.white,
        background: Colors.blueGrey),
  );
}
