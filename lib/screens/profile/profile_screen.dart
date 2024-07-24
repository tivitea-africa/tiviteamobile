import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/widget/phone_number_field.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';

import '../../core/const/app_assets.dart';
import '../../core/const/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        )),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfileScreenTwo()));
            },
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(10),
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  PlaceholderAssets.pfp,
                ),
                radius: 65,
              ),
            ),
            const Gap(5),
            Text('John Doe D',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color(0xff000035))),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 14,
                ),
                const Gap(5),
                Text(
                  'Change password',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Gap(30),
            buildTextField('John Doe D', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            const BuildPhoneNumberField(hintText: '8034857374'),
            const Gap(10),
            buildTextField(
                'johnddoe@gmail.com',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false),
            buildTextField('Male', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            buildTextField('24/05/1990', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            buildTextField(
                '45 pound road Lagos Alaba',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false),
            buildTextField('Lagos', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
          ],
        ),
      ),
    );
  }
}

//
// AssetImage(
// PlaceholderAssets.pfp,
// ),
