import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../const/app_assets.dart';

AppBar customAppBar({
  Widget? leading,
  String? title,
}) {
  return AppBar(
    leading: leading,
    title: Text(
      title ?? '',
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff000050)),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(Iconsax.notification, color: Color(0xff000050)),
            Gap(8),
            CircleAvatar(
              radius: 22.5,
              backgroundImage: AssetImage(
                PlaceholderAssets.pfp,
              ),
            ),
          ],
        ),
      ),
    ],
    surfaceTintColor: Colors.transparent,
  );
}
