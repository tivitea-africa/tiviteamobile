import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/screens/profile/reviews_screen.dart';

import '../const/app_colors.dart';

class CustomFavouriteCard extends StatelessWidget {
  const CustomFavouriteCard({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReviewsScreen(),
          ),
        );
        // Navigate to the Customer Review screen or perform an action
      },
      child: Container(
        height: 133,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Color(0xffD8D8DD),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image.asset(
                    image,
                    height: 124,
                    width: 137,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                    right: 8,
                    top: 11,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xffF3EBEB),
                      child: Icon(
                        Icons.favorite,
                        size: 12,
                        color: Color(0xffFD1506),
                      ),
                    )),
              ],
            ),
            const Gap(10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 7, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors
                            .deepBlue, // Adjust color to match the title color
                      ),
                    ),
                    const Gap(2),
                    const SizedBox(width: 4),
                    Text(
                      'Conference room with comfortable ergonomic chairs',
                      style: GoogleFonts.poppins(
                          letterSpacing: 0.6,
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '⭐',
                                style: TextStyle(fontSize: 14),
                              ),
                              const Gap(5),
                              Text(
                                '4.5',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.24,
                                    color: const Color(0xff464255)),
                              ),
                              const Gap(30),
                            ],
                          ),
                          Text(
                            '₦ 25,000',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: const Color(
                                  0xff000050), // Adjust color to match the price color
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      height: 18,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 0.15,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.directions_walk,
                            color: Color(0xff000050),
                            size: 11,
                          ),
                          Text(
                            '20 Mins',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff000000),
                                fontSize: 11),
                          ),
                          const Icon(
                            Icons.location_on_rounded,
                            color: Color(0xff000050),
                            size: 11,
                          ),
                          Text(
                            '5.4km',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff000000),
                                fontSize: 11),
                          ),
                          const Icon(
                            Icons.access_time_filled_rounded,
                            color: Color(0xff000050),
                            size: 11,
                          ),
                          Text(
                            'Open',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff000000),
                                fontSize: 11),
                          ),
                        ],
                      ),
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
}
