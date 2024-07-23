import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/screens/home_section/home_screen.dart';

import '../../core/widget/reusbale_buttons.dart';
import 'documents_submitted.dart';

class AccountVerificationSuccessful extends StatelessWidget {
  const AccountVerificationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Gap(50),
                const Icon(
                  Icons.receipt_long_outlined,
                  size: 60,
                  color: Color(0xff006400),
                ),
                const Gap(40),
                Text(
                  'Account Verification Successful!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: const Color(0xff0E0E1B)),
                ),
                const Gap(20),
                Text(
                  'Your account has been verified successfully!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            FullButton(
              bgColor: const Color(0xff000050),
              text: 'Go to Dashboard',
              width: double.infinity,
              height: 44,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
