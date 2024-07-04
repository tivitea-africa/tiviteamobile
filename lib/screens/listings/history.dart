import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/screens/listings/new_listings.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios_new_outlined, size: 17),
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
        body: Container(
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
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffF3F3F4),
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff8A8A99)),
                          suffixIcon: const Icon(
                            Icons.clear_all_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff000050)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewListings()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Iconsax.add,
                                  color: Colors.white, size: 15),
                              const SizedBox(width: 7),
                              Text(
                                "New",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
              const Gap(30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                decoration: BoxDecoration(
                    color: const Color(0xffF3F3F4),
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
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
