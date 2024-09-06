import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/main.dart';

Widget buildTextField(
  String hintText,
  IconData? icon,
  double radius,
  double height,
  Color color,
  BorderSide borderSide,
  bool focus, {
  TextInputType? type = TextInputType.text,
}) {
  return SizedBox(
    height: height.h,
    child: TextField(
      keyboardType: type,
      autofocus: focus,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8A8A99)),
        suffixIcon: Icon(
          icon,
          size: 20.sp,
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

class PasswordField extends StatefulWidget {
  final String hintText;
  const PasswordField({
    super.key,
    required this.hintText,
  });
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        obscureText: _obscureText,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffFFFFFF),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8A8A99),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off_outlined : Icons.visibility,
              size: 20.sp,
              color: Colors.grey,
            ),
            onPressed: _toggleVisibility,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xffD8D8DD)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xffD8D8DD)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xffD8D8DD)),
          ),
        ),
      ),
    );
  }
}
