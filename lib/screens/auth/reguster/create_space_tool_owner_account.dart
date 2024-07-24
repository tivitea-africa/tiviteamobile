import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tivi_tea/screens/auth/reguster/create_space_tool_owner_account_2.dart';
import '../../../core/widget/reusbale_buttons.dart';

class SpaceOwnerAccount extends StatelessWidget {
  const SpaceOwnerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child:
                const Image(image: AssetImage('assets/placeholders/logo.png'))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.chevron_left),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Icon(Icons.menu)
              ],
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 105,
              width: 380,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Section Header.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Space/Tool Owner',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  const Gap(10),
                  Text(
                    'Registration is quick and easy, Lets help you reach a wider audience  today!',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const Gap(30),
            Align(
                alignment: Alignment.center,
                child: Text('Register as a space or tool user',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 18))),
            const Gap(2),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Provide correct information to setup your account',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal Information',
                    style: GoogleFonts.poppins(
                        backgroundColor: Color(0xffE6F6FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff0E0E1B))),
                Gap(20),
                Text('First Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter first name',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false),
                const Gap(15),
                Text('Last Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Last name',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false),
                const Gap(15),
                Text('Phone Number',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                SizedBox(
                  height: 45,
                  child: IntlPhoneField(
                    showCountryFlag: true,
                    dropdownDecoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Color(0xffD8D8DD)))),
                    dropdownIconPosition: IconPosition.trailing,
                    disableLengthCheck: true,
                    dropdownIcon: const Icon(Icons.keyboard_arrow_down),
                    flagsButtonPadding: const EdgeInsets.only(left: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF),
                      hintText: 'Enter Phone Number',
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
                ),
                const Gap(15),
                Text('Email',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Email',
                    Icons.mail_outline_rounded,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.emailAddress),
                const Gap(25),
                Text('Location Details',
                    style: GoogleFonts.poppins(
                        backgroundColor: Color(0xffE6F6FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff0E0E1B))),
                Gap(20),
                Text('Your Address',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Address',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.streetAddress),
                Gap(15),
                Text('City',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField('', null, 8, 45, const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)), false,
                    type: TextInputType.streetAddress),
                const Gap(15),
                Text('Country',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                SizedBox(
                  ///TODO: Implement country
                  height: 45,
                  child: IntlPhoneField(
                    showCountryFlag: true,
                    dropdownDecoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Color(0xffD8D8DD)))),
                    dropdownIconPosition: IconPosition.trailing,
                    disableLengthCheck: true,
                    dropdownIcon: const Icon(Icons.keyboard_arrow_down),
                    flagsButtonPadding: const EdgeInsets.only(left: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF),
                      hintText: 'Enter Country',
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
                ),
                const Gap(15),
                Text('State/Province',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                  'Enter State/Province',
                  null,
                  8,
                  45,
                  const Color(0xffFFFFFF),
                  const BorderSide(color: Color(0xffD8D8DD)),
                  false,
                ),
                const Gap(15),
                Text('Postal/Zip Code',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Postal/Zip Code',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.number),
                const Gap(40),
                FullButton(
                  bgColor: const Color(0xff000050),
                  text: 'Next',
                  width: double.infinity,
                  height: 44,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SpaceOwnerAccountInformation()));
                  },
                  color: Colors.white,
                ),
                const Gap(30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
