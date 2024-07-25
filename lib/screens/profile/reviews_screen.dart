import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/profile/notifications_screen.dart';
import '../../core/const/app_colors.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left),
          onTap: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Reviews',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xff000050)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
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
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 283,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage('assets/placeholders/space1.png'),
                      fit: BoxFit.cover)),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Regal Hub',
                      style: GoogleFonts.inter(
                          color: const Color(0xff000050),
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const Gap(5),
                    Text(
                      'Victoria Island, Lagos',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color(0xff737380)),
                    ),
                    const Gap(7),
                    Row(
                      children: [
                        const Text(
                          '⭐',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Gap(5),
                        Text(
                          '4.5',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.63,
                              color: const Color(0xff464255)),
                        ),
                        const Gap(10),
                        Text(
                          '(365 Reviews)',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff77797D)),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_forward, color: Color(0xff000050)),
                    const Gap(5),
                    Text(
                      'Conference room',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff737380)),
                    )
                  ],
                ),
              ],
            ),
            const Gap(30),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your overall rating of this product',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color(0xff9D9DAA)),
                  ),
                  const Gap(10),
                  const Text(
                    '⭐   ⭐   ⭐   ⭐   ⭐',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            const Gap(35),
            Text(
              'Add detailed review',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000050)),
            ),
            const Gap(10),
            Container(
              height: 200, // Set the height to match the screenshot
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F4),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(10),
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Type Here',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff737380),
                  ),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const Gap(30),
            FullButton(
              bgColor: const Color(0xff000050),
              text: 'Submit',
              width: double.infinity,
              height: 40,
              onPressed: () {},
              color: Colors.white,
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
