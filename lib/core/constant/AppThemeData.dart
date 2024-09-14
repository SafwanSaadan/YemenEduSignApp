// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AppColor.dart';

ThemeData AppThemeData() => ThemeData(
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.cairo(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        headlineSmall:
            GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.bold),
        labelLarge: GoogleFonts.cairo(
            color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold),
        labelMedium: GoogleFonts.cairo(
            color: AppColor.black, fontSize: 14, fontWeight: FontWeight.bold),
        labelSmall:
            GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.w600),
        bodyMedium:
            GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.cairo(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent, splashColor: AppColor.red),
    );
