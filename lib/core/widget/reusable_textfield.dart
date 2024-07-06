import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField(
  String hintText,
  IconData? icon,
  double radius,
  double height,
  Color color,
  BorderSide borderSide,
  bool focus,
) {
  return SizedBox(
    height: height,
    child: TextField(
      autofocus: focus ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8A8A99)),
        suffixIcon: Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: borderSide,
        ),
      ),
    ),
  );
}
