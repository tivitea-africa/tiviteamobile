import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/auth/kyc/account_verification.dart';
import 'package:tivi_tea/screens/auth/kyc/verify_address.dart';

class VerifyIdentity extends StatelessWidget {
  const VerifyIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Proof of Identity',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000050)),
                ),
                Gap(3),
                Text(
                  'Provide correct information to help us verify your \naccount',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff5C5C66)),
                ),
                Gap(20),
                Text(
                  'Document Type',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(4),

                ///TODO: Implement dropdownMenu
                buildTextField(
                    'National Identity Card (NIN)',
                    Icons.keyboard_arrow_down_outlined,
                    8,
                    58,
                    Color(0xffFFFFFF),
                    BorderSide(color: Color(0xffD8D8DD)),
                    false),
                Gap(15),
                Text(
                  'NIN Number ',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(4),
                buildTextField(
                    'Enter NIN Number',
                    null,
                    8,
                    58,
                    Color(0xffFFFFFF),
                    BorderSide(color: Color(0xffD8D8DD)),
                    false),
                Gap(15),
                Text(
                  'Upload Front side of ID Card',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(3),
                Text(
                  'Upload the front side of your support document in JPG, PNG, or PDF',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff5C5C66)),
                ),
                Gap(15),
                Container(
                  height: 67,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFFFFF),
                      border: Border.all(color: Color(0xffD8D8DD))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'No file added',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff737380)),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        height: 53,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: Color(0xff737380),
                            ),
                            Gap(5),
                            Text(
                              'Select file',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff737380)),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Text(
                  'Upload Back side of ID Card',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Text(
                  'Upload the back side of your support document in JPG, PNG, or PDF',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff5C5C66)),
                ),
                Gap(15),
                Container(
                  height: 67,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFFFFF),
                      border: Border.all(color: Color(0xffD8D8DD))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'No file added',
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff737380)),
                          ),
                        ),
                      ),
                      Container(
                        width: 126,
                        height: 53,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: Color(0xff737380),
                            ),
                            Gap(5),
                            Text(
                              'Select file',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff737380)),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(100),
            FullButton(
              bgColor: const Color(0xff000050),
              text: 'Next',
              width: double.infinity,
              height: 44,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountVerification()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
