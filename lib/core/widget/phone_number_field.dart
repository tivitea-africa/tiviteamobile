import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class BuildPhoneNumberField extends StatelessWidget {
  const BuildPhoneNumberField({

    super.key, required this.hintText,
  });
final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: IntlPhoneField(
        showCountryFlag: true,
        dropdownDecoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Color(0xffD8D8DD)))),
        dropdownIconPosition: IconPosition.trailing,
        disableLengthCheck: true,
        dropdownIcon: const Icon(Icons.keyboard_arrow_down),
        flagsButtonPadding: const EdgeInsets.only(left: 20),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 5),
          filled: true,
          fillColor: const Color(0xffFFFFFF),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff8A8A99)),
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
        languageCode: "en",
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print('Country changed to: ' + country.name);
        },
      ),
    );
  }
}
