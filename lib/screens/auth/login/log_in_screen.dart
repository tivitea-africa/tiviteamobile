import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/screens/auth/password_screens/forgot_password.dart';
import 'package:tivi_tea/screens/auth/reguster/options_register.dart';
import 'package:tivi_tea/screens/home_section/home_screen.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/widget/custom_clip_path.dart';
import '../../../core/widget/reusable_textfield.dart';
import '../../../core/widget/reusbale_buttons.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: CustomClipperPath(),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff000090), Color(0xff000050)])),
                height: 160,
              ),
            ),
            SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Login',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000050), // Dark blue color
                        )),
                    const Gap(2),
                    Text('Provide your credentials to access your account',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff737380))),
                    const Gap(30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
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
                        Text('Password',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xff0E0E1B))),
                        const Gap(4),
                        const PasswordField(hintText: 'Enter Password'),
                        const Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    visualDensity: const VisualDensity(
                                        horizontal: -4, vertical: -4),
                                    side: const BorderSide(
                                        color: Color(0xffD8D8DD)),
                                    activeColor: const Color(0xff000050),
                                    value: checkBoxValue,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        checkBoxValue = newValue;
                                      });
                                    }),
                                Text(
                                  'Remember me',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xffD9291E)),
                              ),
                            ),
                          ],
                        ),
                        const Gap(50),
                        FullButton(
                          bgColor: const Color(0xff000050),
                          text: 'Log into Account',
                          width: double.infinity,
                          height: 40,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          color: Colors.white,
                        ),
                        const Gap(20),
                        ImgTxtButton(
                          bgColor: Colors.transparent,
                          height: 40,
                          onPressed: () {},
                          width: double.infinity,
                          image: PlaceholderAssets.google,
                          color: Colors.grey,
                          text: 'Sign Up with Google',
                          fontSize: 14,
                        ),
                        const Gap(20),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Don’t have account? ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff737380))),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OptionsRegisterScreen())),
                                  text: 'Sign Up',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: const Color(0xffEC8305)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
