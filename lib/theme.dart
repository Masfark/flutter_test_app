import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() => ThemeData(
      // * Main clors theme
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      accentColor: kSecondaryColor,

      textTheme: TextTheme(
        headline6: GoogleFonts.lobster(fontSize: 48.0, color: kPrimaryColor),
        headline4: GoogleFonts.lobster(fontSize: 24.0, color: kWhite),
      ),

      // * Elevated button style
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),

      // * Floating Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
      ),
    );
