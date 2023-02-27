import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(primary: Colors.blue),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        dividerColor: Colors.blue,
        appBarTheme: const AppBarTheme(color: Colors.blue),
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: _textTheme,
        shadowColor: Colors.grey,
        cardColor: Colors.white,
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Colors.grey.shade200),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: _textTheme,
        shadowColor: Colors.transparent,
        cardColor: Colors.blueGrey[600],
      );

  static const TextTheme _textTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: TextStyle(fontSize: 16.0),
  );
}
