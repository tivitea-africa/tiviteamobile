import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../const/app_colors.dart';

class CategoryCustomCard extends StatelessWidget {
  const CategoryCustomCard(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.image,
      required this.status,
      required this.statusColor});
  final Color color;
  final IconData icon;
  final String title;
  final String image;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 130,
              width: 137,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 7, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          size: 11,
                          color: statusColor,
                        ),
                        const Gap(2),
                        Text(
                          status,
                          style: GoogleFonts.poppins(
                            color: statusColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 8.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors
                          .deepBlue, // Adjust color to match the title color
                    ),
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.location,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Main Island, Lagos',
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Listed by:',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.8,
                                  color: const Color(0xff4B465C)),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Richard William',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff77797D),
                                      fontSize: 9.8,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Gap(5),
                                const CircleAvatar(
                                  backgroundColor: Color(0xff006400),
                                  radius: 6,
                                  child: Icon(
                                    Iconsax.verify,
                                    size: 11,
                                    color: Colors.white,
                                  ),
                                ),
                                Gap(30),
                                Text(
                                  '₦ 25,000',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color(
                                        0xff000050), // Adjust color to match the price color
                                  ),
                                ),
                              ],
                            )
                          ],
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
    );
  }
}
