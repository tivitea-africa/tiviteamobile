// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.index,
    required this.onTap,
    required this.color,
    required this.label,
    required this.icon,
  });
  final Color? color;
  final String label;
  final IconData icon;
  int index;
  void Function()? onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              size: 18,
              icon,
              color: color,
            ),
            const Gap(4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
