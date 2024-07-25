import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/widget/custom_favourite_card.dart';
import 'package:tivi_tea/screens/profile/reviews_screen.dart';

import '../../core/const/app_assets.dart';
import '../../core/const/app_colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

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
            'Favourite',
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
                      builder: (context) => const ReviewsScreen()));
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const CustomFavouriteCard(
                  image: PlaceholderAssets.image1,
                  title: 'Conference room',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
