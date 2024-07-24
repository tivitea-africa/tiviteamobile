import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tivi_tea/screens/auth/reguster/create_account_feedback.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/widget/reusbale_buttons.dart';
import '../login/log_in_screen.dart';

class SpaceOwnerAccountInformation extends StatelessWidget {
  const SpaceOwnerAccountInformation({super.key});

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
                Text('Account Information',
                    style: GoogleFonts.poppins(
                        backgroundColor: Color(0xffE6F6FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff0E0E1B))),
                Gap(20),
                Text('Username',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Username',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false),
                const Gap(15),
                Text('Alternate Phone number',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField('', null, 8, 45, const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)), false,
                    type: TextInputType.phone),
                const Gap(15),
                Text('Create Password',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                const PasswordField(hintText: 'Enter New Password'),
                const Gap(15),
                Text('Confirm Password',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                const PasswordField(hintText: 'Confirm New Password'),
                const Gap(25),
                Text('Business Details',
                    style: GoogleFonts.poppins(
                        backgroundColor: Color(0xffE6F6FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff0E0E1B))),
                Gap(20),
                Text('Business Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Company Name',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false),
                Gap(15),

                ///TODO: This should be a dropdown menu
                Text('Registration Status',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Registered or individual business',
                    Icons.keyboard_arrow_down_outlined,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false),
                const Gap(15),
                Text('Website',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField('Optional', null, 8, 45, const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)), false,
                    type: TextInputType.url),
                const Gap(15),
                Text('Business Description',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Brief description of space or tool offered',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.text),
                Gap(20),
                Text('Bank Details',
                    style: GoogleFonts.poppins(
                        backgroundColor: Color(0xffE6F6FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: const Color(0xff0E0E1B))),
                Gap(20),
                Text('Bank Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Bank Name',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.name),
                Gap(15),
                Text('Account Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Account Name',
                    null,
                    8,
                    45,
                    const Color(0xffFFFFFF),
                    const BorderSide(color: Color(0xffD8D8DD)),
                    false,
                    type: TextInputType.name),
                Gap(15),
                Text('Account Number',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                buildTextField(
                    'Enter Account Number',
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
                  text: 'Create Account',
                  width: double.infinity,
                  height: 44,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnAccountCreation()));
                  },
                  color: Colors.white,
                ),
                const Gap(10),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Already have a account? ',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff737380))),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen())),
                          text: 'Login',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color(0xffEC8305)),
                        ),
                      ],
                    ),
                  ),
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
