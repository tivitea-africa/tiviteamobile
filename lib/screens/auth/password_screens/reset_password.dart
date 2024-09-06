import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/screens/auth/password_screens/password_changed_feedback.dart';

import '../../../core/widget/custom_clip_path.dart';
import '../../../core/widget/reusable_textfield.dart';
import '../../../core/widget/reusbale_buttons.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                height: 120.h,
              ),
            ),
            SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Icon(
                            Icons.chevron_left,
                            size: 30,
                          )),
                    ),
                    SizedBox(height: 20.h),
                    Text('Reset Password',
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff0E0E1B), // Dark blue color
                        )),
                    const Gap(5),
                    Text('Set a new password for your account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff737380))),
                    const Gap(30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Password',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0xff0E0E1B))),
                        const Gap(4),
                        const PasswordField(hintText: 'Enter Password'),
                        const Gap(15),
                        Text('Confirm Password',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0xff0E0E1B))),
                        const Gap(4),
                        const PasswordField(hintText: 'Enter Password Again'),
                        const Gap(40),
                        FullButton(
                          bgColor: const Color(0xff000050),
                          text: 'Submit',
                          width: double.infinity,
                          height: 40.h,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordFeedback()));
                          },
                          color: Colors.white,
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
