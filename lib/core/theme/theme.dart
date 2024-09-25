import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primaryColor = Color(0xFF000050);

double _textFieldLabelFontSize = 12.sp;
double _buttonTextFontSize = 14.sp;
double _titleSmallFontSize = 15.sp;
double _bodySmallFontSize = 16.sp;
double _bodyLargeFontSize = 18.sp;
double _displayLargeFontSize = 22.sp;
double _titleMediumFontSize = 24.sp;
double _titleLargeFontSize = 28.sp;

final lightTheme = Provider<ThemeData>(
  (_) => ThemeData(
    primaryColor: _primaryColor,
    secondaryHeaderColor: const Color(0xFFE6F6FD),
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(0xFF037EE6).withOpacity(0.5),
    primaryColorLight: const Color(0xFFE7E9EF),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll<double>(0),
        backgroundColor: const WidgetStatePropertyAll<Color>(_primaryColor),
        foregroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFE6E6EE)),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          GoogleFonts.poppins(
            fontSize: _buttonTextFontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white,
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
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: _titleSmallFontSize,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: _bodySmallFontSize,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: _bodyLargeFontSize,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: _displayLargeFontSize,
        fontWeight: FontWeight.w500,
      ),      
      displaySmall: GoogleFonts.poppins(
        fontSize: _buttonTextFontSize,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: _textFieldLabelFontSize,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF0E0E1B),
      ),
    ),
  ),
);
