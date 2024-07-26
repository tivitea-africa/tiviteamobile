import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/custom_tetfield.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/service_provider/bottomNav/navbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: AppColors.deepBlue,
            )),
        title: Center(
          child: Text(
            'My Profile',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xff000050)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification,
              color: AppColors.deepBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.element_4,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Change Password',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const Gap(8),
            Container(
              height: 439,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Set a new password for your account',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Gap(56),
                    const CustomFormTextField(
                      labelText: 'New Password',
                      hintText: 'Enter Password',
                      fieldName: 'Password',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(24),
                    const CustomFormTextField(
                      labelText: 'Confirm New Password',
                      hintText: 'Enter Password',
                      fieldName: 'Password',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(60),
                    FullButton(
                      bgColor: const Color(0xff000050),
                      text: 'Submit',
                      width: double.infinity,
                      height: 40,
                      onPressed: () => _showPasswordChangedDialog(context),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordChangedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            height: 380,
            width: 320,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageAssets.success,
                  height: 92,
                  width: 92,
                ),
                const Gap(20),
                const Text(
                  'Password Changed!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                const Text(
                  'Your password has been changed successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Gap(20),
                FullButton(
                  bgColor: const Color(0xff000050),
                  text: 'Go Back',
                  width: 233,
                  height: 40,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServiceNaviBar(),
                      ),
                    );
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
