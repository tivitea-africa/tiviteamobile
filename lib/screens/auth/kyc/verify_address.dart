import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/auth/kyc/account_verification.dart';
import 'package:tivi_tea/screens/auth/kyc/verify_identity.dart';

class VerifyAddress extends StatefulWidget {
  const VerifyAddress({super.key});

  @override
  State<VerifyAddress> createState() => _VerifyAddressState();
}

class _VerifyAddressState extends State<VerifyAddress> {
  bool? checkBoxValue = false;
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
                  'Business Verification',
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
                  'Proof of Business Address',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(4),

                ///TODO: Implement dropdownMenu
                buildTextField(
                    'Utility Bill',
                    Icons.keyboard_arrow_down_outlined,
                    8,
                    58,
                    Color(0xffFFFFFF),
                    BorderSide(color: Color(0xffD8D8DD)),
                    false),
                Gap(15),
                Text(
                  'Upload file',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0E0E1B)),
                ),
                Gap(3),
                Text(
                  'Upload scanned copy of your business registration document in JPG, PNG, or PDF',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff5C5C66)),
                ),
                Gap(15),
                //TODO: IMPLEMENT bottomSheet
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
                Gap(100),
                Row(
                  children: [
                    Checkbox(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        side: const BorderSide(color: Color(0xffD8D8DD)),
                        activeColor: const Color(0xff000050),
                        value: checkBoxValue,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Text(
                      'I confirm that all information provided are correct\nand legitimate.',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            Gap(40),
            Align(
              alignment: Alignment.bottomCenter,
              child: FullButton(
                bgColor: const Color(0xff000050),
                text: 'Next',
                width: double.infinity,
                height: 44,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyIdentity()));
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
