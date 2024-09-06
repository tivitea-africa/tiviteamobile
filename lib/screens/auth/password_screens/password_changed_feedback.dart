import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/auth/login/log_in_screen.dart';

import '../../../core/widget/custom_clip_path.dart';

class PasswordFeedback extends StatelessWidget {
  const PasswordFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xffD5DED5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Color(0xff006400),
                    size: 60.sp,
                  ),
                ),
                const Gap(20),
                Text(
                  'Password Changed !',
                  style: GoogleFonts.dmSans(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff0E0E1B),
                  ),
                ),
                Text(
                  'You have successfully changed your password',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff737380),
                  ),
                ),
                Gap(20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FullButton(
                    bgColor: const Color(0xff000050),
                    text: 'Go to Login',
                    width: double.infinity,
                    height: 40.h,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
