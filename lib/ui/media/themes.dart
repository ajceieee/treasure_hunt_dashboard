import 'package:flutter/material.dart';

class AppTheme {
  // dark theme data
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF212332),
    primaryColor: Color(0xffF7A302),
    accentColor: Color(0xFF2A2D3E),
    fontFamily: "Poppins"
  );

  ThemeData get darkTheme => _darkTheme;

  // light theme data
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.blue[300],
    accentColor: Colors.grey[200],
    primaryColor: Colors.white,
    fontFamily: "Poppins",

  );

  ThemeData get lightTheme => _lightTheme;
}
