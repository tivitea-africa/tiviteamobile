import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/screens/bottomNav/bottom_nav.dart';

class NewListings extends StatefulWidget {
  const NewListings({super.key});

  @override
  State<NewListings> createState() => _NewListingsState();
}

String selectedValue = '';

class _NewListingsState extends State<NewListings> {
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
                    fontSize: 17),
              ),
              const Gap(40),
              RadioMenuButton(
                style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xffF3F3F4)),
                  elevation: MaterialStateProperty.all(1),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedValue == "Co-Working Space"
                            ? Color(0xff000050)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                ),
                value: "Co-Working Space",
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Iconsax.people,
                      size: 18,
                      color: Color(0xff000050),
                    ),
                    const Gap(15),
                    Text(
                      "Co-Working Space",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff000050),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Gap(15),
              RadioMenuButton(
                style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xffF3F3F4)),
                  elevation: MaterialStateProperty.all(1),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedValue == "Work Tool"
                            ? Color(0xff000050)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                ),
                value: "Work Tool",
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Iconsax.bag,
                      size: 18,
                      color: Color(0xff000050),
                    ),
                    const Gap(15),
                    Text(
                      "Work Tool",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff000050),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Gap(15),
              RadioMenuButton(
                style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xffF3F3F4)),
                  elevation: MaterialStateProperty.all(1),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: selectedValue == "Other Listing"
                            ? Color(0xff000050)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                ),
                value: "Other Listing",
                groupValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Iconsax.box,
                      size: 18,
                      color: Color(0xff000050),
                    ),
                    const Gap(15),
                    Text(
                      "Other Listing",
                      style: GoogleFonts.poppins(
                          color: const Color(0xff000050),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Gap(20),
              DropdownMenu(
                leadingIcon: Icon(
                  Iconsax.box,
                  size: 18,
                  color: Color(0xff9D9DAA),
                ),
                enabled: false,
                textStyle: GoogleFonts.poppins(
                    color: Color(0xff0E0E1B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                selectedTrailingIcon: Icon(Iconsax.arrow_circle_up),
                hintText: 'Other Listing Category',
                trailingIcon: Icon(Iconsax.arrow_circle_down),
                width: MediaQuery.of(context).size.width * 0.93,
                dropdownMenuEntries: <DropdownMenuEntry>[
                  DropdownMenuEntry(value: 'value', label: 'label'),
                ],
              ),
              Gap(40),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff000050)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {},
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
