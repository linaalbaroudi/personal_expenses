import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expenses/utils/palette.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      color: Palette.black,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      color: Palette.black,
    ),
    bodySmall: GoogleFonts.vazirmatn(
      fontSize: 14.0,
      color: Palette.black,
    ),
    labelLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelSmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    headlineMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    headlineSmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    displayLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displayMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displaySmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      color: Palette.lightGray,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      color: Palette.lightGray,
    ),
    bodySmall: GoogleFonts.vazirmatn(
      fontSize: 14.0,
      color: Palette.lightGray,
    ),
    labelLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelSmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.white,
    ),
    headlineMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.white,
    ),
    headlineSmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.white,
    ),
    displayLarge: GoogleFonts.vazirmatn(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displayMedium: GoogleFonts.vazirmatn(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displaySmall: GoogleFonts.vazirmatn(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
  );

  // TODO: test and adjust light theme color
  static ThemeData light() {
    return ThemeData(
      textTheme: lightTextTheme,
      primaryColor: Palette.purple,
      focusColor: Palette.orange,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Palette.white,
        backgroundColor: Palette.purple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Palette.orange),
          textStyle: MaterialStateTextStyle.resolveWith(
              (states) => lightTextTheme.bodyLarge!),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Palette.purple,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.purple,
        foregroundColor: Palette.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Palette.orange,
          ),
        ),
        focusColor: Palette.orange,
        floatingLabelStyle: lightTextTheme.displayLarge,
        labelStyle: lightTextTheme.labelMedium,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Palette.orange,
      ),
    );
  }

  // TODO: test and adjust dark theme color
  static ThemeData dark() {
    return ThemeData(
      textTheme: darkTextTheme,
      primaryColor: Palette.purple,
      focusColor: Palette.orange,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Palette.darkGray,
        backgroundColor: Palette.purple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Palette.orange),
          textStyle: MaterialStateTextStyle.resolveWith(
              (states) => lightTextTheme.bodyLarge!),
        ),
      ),
      iconTheme: IconThemeData(
        color: Palette.purple,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.purple,
        foregroundColor: Palette.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Palette.orange,
          ),
        ),
        focusColor: Palette.orange,
        floatingLabelStyle: lightTextTheme.titleLarge,
        labelStyle: lightTextTheme.labelLarge,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Palette.orange,
      ),
    );
  }
}
