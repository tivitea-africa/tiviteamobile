import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primaryColor = Color(0xFF000050);

double _buttonTextFontSize = 14.sp;
double _bodySmallFontSize = 16.sp;
double _titleSmallFontSize = 15.sp;
double _titleMediumFontSize = 24.sp;
double _titleLargeFontSize = 28.sp;

final lightTheme = Provider<ThemeData>(
  (_) => ThemeData(
    primaryColor: _primaryColor,
    brightness: Brightness.light,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll<Color>(_primaryColor),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          GoogleFonts.poppins(
            fontSize: _buttonTextFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: _titleLargeFontSize,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: _titleMediumFontSize,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: _titleSmallFontSize,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: _bodySmallFontSize,
        fontWeight: FontWeight.w300,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: _buttonTextFontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
);
