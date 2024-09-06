import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tivi_tea/main.dart';
import 'package:tivi_tea/screens/auth/login/log_in_screen.dart';
import 'package:tivi_tea/screens/auth/reguster/create_account_feedback.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/widget/reusbale_buttons.dart';

class CreateBuyerAccount extends StatelessWidget {
  const CreateBuyerAccount({super.key});

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
              height: 105.h,
              width: 380.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Section Header.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buyer/Customer',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: Colors.white),
                  ),
                  const Gap(10),
                  Text(
                    'New to tiviTea? create your account and get started.',
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp,
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
                        fontWeight: FontWeight.w600, fontSize: 18.sp))),
            const Gap(2),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Provide correct information to setup your account',
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp, fontWeight: FontWeight.w400),
                )),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
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
                        fontSize: 12.sp,
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
                        fontSize: 12.sp,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                SizedBox(
                  height: 45.h,
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
                      contentPadding: const EdgeInsets.only(left: 5),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF),
                      hintText: 'Enter Phone Number',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14.sp,
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
                        fontSize: 12.sp,
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
                const Gap(15),
                Text('Create Password',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                const PasswordField(hintText: 'Enter New Password'),
                const Gap(15),
                Text('Confirm Password',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff0E0E1B))),
                const Gap(4),
                const PasswordField(hintText: 'Confirm New Password'),
                const Gap(40),
                FullButton(
                  bgColor: const Color(0xff000050),
                  text: 'Create Account',
                  width: double.infinity,
                  height: 44.h,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnAccountCreation()));
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
                                fontSize: 14.sp,
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
                              fontSize: 14.sp,
                              color: const Color(0xffEC8305)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(30),
                ImgTxtButton(
                  bgColor: Colors.transparent,
                  height: 44.h,
                  onPressed: () {},
                  width: double.infinity,
                  image: PlaceholderAssets.google,
                  color: Colors.grey,
                  text: 'Sign Up with Google',
                  fontSize: 14.sp,
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
