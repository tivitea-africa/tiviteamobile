import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ReusableAddTextButton extends StatelessWidget {
  const ReusableAddTextButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
    required this.fontColor,
  });
  final Function() onTap;
  final String title;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Iconsax.add, color: fontColor, size: 15),
            const SizedBox(width: 7),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w700, color: fontColor),
            )
          ],
        ));
  }
}
