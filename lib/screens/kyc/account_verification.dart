import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widget/reusbale_buttons.dart';
import 'documents_submitted.dart';

class AccountVerification extends StatelessWidget {
  const AccountVerification({super.key});

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
                  Icons.receipt_long_outlined,
                  size: 60,
                  color: Color(0xff000050),
                ),
                Gap(40),
                Text(
                  'Account Verification',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(20),
                Text(
                  'Please know that account verification may \ntake up to 2 business days. You will be \nnotified about the status of your verification.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            FullButton(
              bgColor: const Color(0xff000050),
              text: 'Submit Documents',
              width: double.infinity,
              height: 44,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DocumentsSubmitted()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
