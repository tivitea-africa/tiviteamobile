import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/auth/reguster/create_space_tool_owner_account.dart';

import '../../../core/widget/custom_clip_path.dart';
import 'create_buyer_customer_accout.dart';

class OptionsRegisterScreen extends StatefulWidget {
  const OptionsRegisterScreen({super.key});

  @override
  State<OptionsRegisterScreen> createState() => _OptionsRegisterScreenState();
}

class _OptionsRegisterScreenState extends State<OptionsRegisterScreen> {
  String selectedRole = 'Service Provider';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    const Gap(20),
                    Text(
                      'How do you want to \nregister?',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.dmSans(
                        fontSize: 24.sp,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(30),
                    buildRadioListTile(
                      title: 'Service Provider',
                      value: 'Service Provider',
                      groupValue: selectedRole,
                      icon: Icons.business_center_outlined,
                    ),
                    const Gap(16),
                    buildRadioListTile(
                      title: 'Customer',
                      value: 'Customer',
                      groupValue: selectedRole,
                      icon: Icons.person_outline,
                    ),
                    const Gap(232),
                    FullButton(
                      text: 'Continue',
                      width: double.infinity,
                      height: 44,
                      onPressed: () {
                        if (selectedRole == 'Service Provider') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SpaceOwnerAccount()));
                        } else if (selectedRole == 'Customer') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateBuyerAccount()));
                        }
                      },
                      color: Colors.white,
                      bgColor: AppColors.deepBlue,
                    ),
                    const Gap(100),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildRadioListTile({
    required String title,
    required String value,
    required String groupValue,
    required IconData icon,
  }) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: value == groupValue ? AppColors.deepBlue : Colors.transparent,
          width: 1.5,
        ),
        color: const Color(0xFFF9F9F9),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: value == groupValue ? Colors.black : Colors.grey,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: value == groupValue ? Colors.black : Colors.grey,
          ),
        ),
        trailing: Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedRole = newValue!;
            });
          },
          activeColor: AppColors.deepBlue,
        ),
        onTap: () {
          setState(() {
            selectedRole = value;
          });
        },
      ),
    );
  }
}
