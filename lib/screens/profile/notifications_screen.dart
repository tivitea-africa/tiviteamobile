import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/const/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
            'Notifications',
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
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000050)),
                      ),
                      GestureDetector(
                        child: Text(
                          'Mark all as read',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000050)),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                ],
              ),
            ),
            const Gap(30),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yesterday',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000050)),
                      ),
                      GestureDetector(
                        child: Text(
                          'Mark all as read',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff000050)),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                  const NotificationsWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    0,
                    1,
                  ),
                  blurRadius: 3,
                  spreadRadius: -5,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              border: Border.all(width: 1, color: const Color(0XFFE8E8EB)),
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 17,
                child: const Icon(
                  Icons.business_center_outlined,
                  size: 22,
                  color: Color(0xff45454D),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Space Booked Sucessfully',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Gap(5),
                  Text(
                    'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.\nLorem Ip',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff737380)),
                  )
                ],
              ),
            ],
          ),
        ),
        const Gap(16)
      ],
    );
  }
}
