import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/custom_app_bar.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/home_section/pages/rent_page.dart';

import '../../core/const/app_assets.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          leading: const Icon(Icons.chevron_left), title: 'Co-Working Space'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 253.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PlaceholderAssets.image2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Regal Hub',
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            color: const Color(0xff000050)),
                      ),
                      const IconTextContainer(
                        textColor: 0xff006400,
                        bgColor: 0xffE5EFE5,
                        icon: Icons.flash_on_outlined,
                        text: 'Available',
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      IconTextContainer(
                          icon: Icons.star,
                          text: '3.5',
                          bgColor: 0xffE7983A,
                          textColor: 0xffFFFFFF),
                      Gap(7),
                      Text('52 reviews',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff737380))),
                    ],
                  ),
                  Gap(30),
                  Text('Description',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16.sp)),
                  Gap(2),
                  Text(
                      'This hub is available for lorem ipsum dolum sequin deporus masqara and so on',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff737380))),
                  Gap(30),
                  Text('Facilities Available Here',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16.sp)),
                  Gap(7),
                  IconTextListTile(text: '24 Hour Access', icon: Iconsax.arrow),
                  IconTextListTile(
                      text: '24 hours CCTV monitoring', icon: Iconsax.video),
                  IconTextListTile(
                      text: 'Uninterrupted Power Supply', icon: Iconsax.flash),
                  IconTextListTile(text: 'Parking', icon: Iconsax.car),
                  IconTextListTile(text: 'Dinner', icon: Iconsax.arrow_swap),
                  IconTextListTile(text: 'Teleconference', icon: Iconsax.video),
                  Gap(30),
                  Text('Location',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16.sp)),
                  Gap(2),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -3),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffD8D8DD)),
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(7)),
                      child: Icon(
                        Iconsax.location,
                        color: Color(0xff77797D),
                        size: 15,
                      ),
                    ),
                    title: Text(
                        'Main island, Lagos,  Idumota \nMain island, Lagos, Nigeria.',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff737380))),
                  ),
                  Gap(30),
                  Text('Contact',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16.sp)),
                  Gap(2),
                  IconTextListTile(
                      text: '(+234) 12 36 31 54 32', icon: Iconsax.call),
                  IconTextListTile(
                      text: 'contact@tivitea.com', icon: Iconsax.message),
                  Gap(30),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 180.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffE8E8EB))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  children: <TextSpan>[
                                TextSpan(
                                    text: 'Get a quotation',
                                    style: GoogleFonts.poppins(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff737380),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600))
                              ],
                                  text: 'You can ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xff737380),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400))),
                          Gap(20),
                          Text(
                              'Prices are available per room \nand available facility',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff737380),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal)),
                          Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: FullIconButton(
                                text: 'Book Now',
                                width: double.infinity,
                                height: 40.h,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => RentalPage()));
                                },
                                color: Colors.white,
                                bgColor: AppColors.deepBlue,
                                icon: Icons.arrow_forward),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(70),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconTextListTile extends StatelessWidget {
  const IconTextListTile({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: -4, vertical: -3),
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 18.sp,
      ),
      title: Text(text),
    );
  }
}

class IconTextContainer extends StatelessWidget {
  const IconTextContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });
  final IconData icon;
  final String text;
  final int bgColor;
  final int textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Color(bgColor), borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: Color(textColor),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
                color: Color(textColor),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
