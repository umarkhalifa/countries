import 'package:flutter/material.dart';

class AppThemes{
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xffff6d00),
      fontFamily: "Poppins",
      shadowColor: Colors.black.withOpacity(0.0),
      iconTheme: const IconThemeData(color: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.grey.withOpacity(0.2),
      dividerColor: Colors.transparent,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary:  Color(0xffff6d00),
          onPrimary: Colors.white,
          secondary:  Color(0xff99a1b4),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black));
  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xffff6d00),
      fontFamily: "Poppins",
      backgroundColor: Colors.grey.withOpacity(0.1),
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.white.withOpacity(0.0),
      dividerColor: Colors.transparent,
      cardColor: Colors.transparent,
      scaffoldBackgroundColor: const Color(0xff000e23),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary:  Color(0xffff6d00),
          onPrimary: Colors.white,
          secondary:  Color(0xff99a1b4),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xff1d1d1d),
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black));
}