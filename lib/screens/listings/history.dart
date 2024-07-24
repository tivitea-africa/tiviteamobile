import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/screens/listings/new_listings.dart';

import '../../core/widget/reusable_add_text_button.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined, size: 17)),
          title: Text(
            "New Listing",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: const Color(0xff000050)),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(Iconsax.notification, color: Color(0xff000050)),
                  SizedBox(width: 20),
                  Icon(Iconsax.element_4, color: Color(0xff000050))
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SizedBox(
                          height: 40,
                          child: buildTextField(
                              "Search",
                              Icons.clear_all_outlined,
                              20,
                              40,
                              const Color(0xffF3F3F4),
                              BorderSide.none,
                              false)),
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 40,
                      child: ReusableAddTextButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewListings()));
                        },
                        title: 'New',
                        color: Color(0xff000050),
                        fontColor: Colors.white,
                      ),
                    )
                  ],
                ),
                const Gap(30),
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      ListingWidget(
                          title: 'Regal Hub',
                          subtitle: 'Workspace',
                          price: '3 Rooms',
                          status: 'assets/placeholders/published.png'),
                      ListingWidget(
                          title: 'Sony x4 Drone',
                          subtitle: 'Tool',
                          price: '# 25,000',
                          status: 'assets/placeholders/published.png'),
                      ListingWidget(
                          title: 'Canon EOS 60D',
                          subtitle: 'Tool',
                          price: '# 25,000',
                          status: 'assets/placeholders/draft.png'),
                      ListingWidget(
                          title: 'Canon EOS 60D',
                          subtitle: 'Tool',
                          price: '# 25,000',
                          status: 'assets/placeholders/draft.png'),
                      ListingWidget(
                          title: 'Canon EOS 60D',
                          subtitle: 'Tool',
                          price: '# 25,000',
                          status: 'assets/placeholders/draft.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListingWidget extends StatelessWidget {
  const ListingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.status,
  });

  final String title;
  final String subtitle;
  final String price;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFFFFF),
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/placeholders/Avatars.png"),
                    ),
                    const Gap(7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff737380)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Gap(crossAxisExtent: 19, 1),
                        Text(
                          "25 Jun 2024",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                              color: const Color(0xff737380)),
                        ),
                        const Gap(10),
                        Image(image: AssetImage(status)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
