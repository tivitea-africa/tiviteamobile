import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/widget/reusable_add_text_button.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';

class OtherListing extends StatefulWidget {
  const OtherListing({super.key});

  @override
  State<OtherListing> createState() => _OtherListingState();
}

class _OtherListingState extends State<OtherListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 17),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            const Gap(20),
            Text(
              "Other Listing",
              style: GoogleFonts.poppins(
                  color: const Color(0xff000050),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Gap(30),
            buildTextField(
                "Name of what you are listing",
                null,
                8,
                56,
                Colors.white,
                const BorderSide(width: 1, color: Colors.black12),
                false),
            const Gap(7),
            buildTextField("Short description", null, 8, 56, Colors.white,
                const BorderSide(width: 1, color: Colors.black12), false),
            const Gap(7),
            buildTextField(
                "Pickup Location",
                Iconsax.location,
                8,
                56,
                Colors.white,
                const BorderSide(width: 1, color: Colors.black12),
                false),
            const Gap(7),
            buildTextField("Rent Price", null, 8, 56, Colors.white,
                const BorderSide(width: 1, color: Colors.black12), false),
            const Gap(30),
            Text(
              "Upload images of space",
              style: GoogleFonts.poppins(
                  color: const Color(0xff000050),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Gap(10),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/placeholders/space3.png",
                    height: double.infinity,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/placeholders/space1.png",
                    height: double.infinity,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/placeholders/space2.png",
                    height: double.infinity,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const Gap(30),
            Row(
              children: [
                SizedBox(
                  height: 35,
                  child: ReusableAddTextButton(
                    onTap: () {},
                    title: "Add Image",
                    color: const Color(0xffE8E8EB),
                    fontColor: Colors.black,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Gap(30),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff000050)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Save & Publish",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                )),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffFFFFFF)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xff000050), width: 2),
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Save to Draft",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff000050)),
                  ),
                )),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
