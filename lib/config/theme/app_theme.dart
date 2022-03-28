import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: const Color.fromARGB(255, 240, 245, 240),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      );
}
