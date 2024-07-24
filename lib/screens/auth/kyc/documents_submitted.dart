import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widget/reusbale_buttons.dart';
import 'account_verification_successful.dart';

class DocumentsSubmitted extends StatelessWidget {
  const DocumentsSubmitted({super.key});

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
                Gap(50),
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 60,
                  color: Color(0xff000050),
                ),
                Gap(40),
                Text(
                  'Documents submitted \nfor verification!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(20),
                Text(
                  'We will notify you about your verification status after 2 business days. ',
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
                        builder: (context) => AccountVerificationSuccessful()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
