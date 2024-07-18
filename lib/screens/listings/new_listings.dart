import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/screens/listings/other_listing.dart';
import 'package:tivi_tea/screens/listings/space_details.dart';
import 'package:tivi_tea/screens/listings/work_tool.dart';

class NewListings extends StatefulWidget {
  const NewListings({super.key});

  @override
  State<NewListings> createState() => _NewListingsState();
}

String? selectedValue = '';

class _NewListingsState extends State<NewListings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              Text(
                "What do you want to List?",
                style: GoogleFonts.poppins(
                    color: const Color(0xff000050),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const Gap(40),
              RadioListTile(
                toggleable: true,
                activeColor: const Color(0xff000050),
                secondary: const Icon(Iconsax.people,
                    size: 18, color: Color(0xff000050)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                value: 'working space',
                tileColor: const Color(0xffF3F3F4),
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                title: Text(
                  "Co-Working Space",
                  style: GoogleFonts.poppins(
                      color: const Color(0xff000050),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Gap(10),
              RadioListTile(
                toggleable: true,
                activeColor: const Color(0xff000050),
                secondary: const Icon(Iconsax.briefcase,
                    size: 18, color: Color(0xff000050)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                value: 'work tool',
                tileColor: const Color(0xffF3F3F4),
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                title: Text(
                  "Work Tool",
                  style: GoogleFonts.poppins(
                      color: const Color(0xff000050),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Gap(10),
              RadioListTile(
                toggleable: true,
                activeColor: const Color(0xff000050),
                secondary:
                    const Icon(Iconsax.box, size: 18, color: Color(0xff000050)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                value: 'other listing',
                tileColor: const Color(0xffF3F3F4),
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                title: Text(
                  "Other Listing",
                  style: GoogleFonts.poppins(
                      color: const Color(0xff000050),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Gap(20),
              DropdownMenu(
                leadingIcon: const Icon(
                  Iconsax.box,
                  size: 18,
                  color: Color(0xff9D9DAA),
                ),
                enabled: false,
                textStyle: GoogleFonts.poppins(
                    color: const Color(0xff0E0E1B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                selectedTrailingIcon: const Icon(Iconsax.arrow_circle_up),
                hintText: 'Other Listing Category',
                trailingIcon: const Icon(Iconsax.arrow_circle_down),
                width: MediaQuery.of(context).size.width * 0.93,
                dropdownMenuEntries: const <DropdownMenuEntry>[
                  DropdownMenuEntry(value: 'value', label: 'label'),
                ],
              ),
              const Gap(40),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff000050)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      if (selectedValue == "working space") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpaceDetails()));
                      } else if (selectedValue == "work tool") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkDetails()));
                      } else if (selectedValue == "other listing") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtherListing()));
                      } else {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
