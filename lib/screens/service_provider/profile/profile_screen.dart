import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/phone_number_field.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/screens/service_provider/profile/change_password.dart';

class ServiceProfileScreen extends StatelessWidget {
  const ServiceProfileScreen({super.key});

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                );
              },
              child: Row(
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
            ),
            const Gap(30),
            buildTextField('John Doe D', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            const BuildPhoneNumberField(
              hintText: '8034857374',
            ),
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
            const BuildPhoneNumberField(
              hintText: 'Nigeria',
            ),
            const Gap(10),
            buildTextField('Lagos', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            buildTextField('920001', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false,
                type: TextInputType.number),
            buildTextField('john_d', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            buildTextField(
                'Alternate Phone Number',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false,
                type: TextInputType.phone),
            const Gap(15),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Business Name',
                    style: GoogleFonts.poppins(
                        color: const Color(0xff8A8A99),
                        fontWeight: FontWeight.w500,
                        fontSize: 14))),
            const Gap(5),
            buildTextField(
                'Neetly Enterprises',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false),
            const Gap(10),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Registration Status',
                    style: GoogleFonts.poppins(
                        color: const Color(0xff8A8A99),
                        fontWeight: FontWeight.w500,
                        fontSize: 14))),
            const Gap(5),
            buildTextField(
                'Registered business',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false),
            const Gap(10),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Website',
                    style: GoogleFonts.poppins(
                        color: const Color(0xff8A8A99),
                        fontWeight: FontWeight.w500,
                        fontSize: 14))),
            const Gap(5),
            buildTextField('Optional', null, 8, 58, const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)), false),
            const Gap(10),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Business Description',
                    style: GoogleFonts.poppins(
                        color: const Color(0xff8A8A99),
                        fontWeight: FontWeight.w500,
                        fontSize: 14))),
            const Gap(5),
            buildTextField(
                'A Co-working space',
                null,
                8,
                58,
                const Color(0xffFFFFFF),
                const BorderSide(width: 1, color: Color(0xffD8D8DD)),
                false),
            const Gap(20),
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
