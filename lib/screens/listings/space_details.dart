import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/widget/reusable_add_text_button.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';

class SpaceDetails extends StatefulWidget {
  const SpaceDetails({super.key});

  @override
  State<SpaceDetails> createState() => _SpaceDetailsState();
}

class _SpaceDetailsState extends State<SpaceDetails> {
  bool value1 = true;
  bool value2 = true;
  bool value3 = true;
  bool value4 = true;
  bool value5 = true;
  bool value6 = false;
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
              "Space details",
              style: GoogleFonts.poppins(
                  color: const Color(0xff000050),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Gap(30),
            buildTextField("Name of Space", null, 8, 56, Colors.white,
                const BorderSide(width: 1, color: Colors.black12), false),
            const Gap(7),
            buildTextField("Short description", null, 8, 56, Colors.white,
                const BorderSide(width: 1, color: Colors.black12), false),
            const Gap(7),
            buildTextField(
                "Address of Space",
                Iconsax.location,
                8,
                56,
                Colors.white,
                const BorderSide(width: 1, color: Colors.black12),
                false),
            const Gap(20),
            Text(
              "Space Amenities",
              style: GoogleFonts.poppins(
                  color: const Color(0xff000050),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            side: const BorderSide(color: Color(0xff8A8A99)),
                            activeColor: const Color(0xff000050),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: const Color(0xffFFFFFF),
                            value: value1,
                            onChanged: (value) {
                              setState(() {
                                value1 = value!;
                              });
                            }),
                        Text(
                          "24 hrs Electricity",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff737380)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            side: const BorderSide(color: Color(0xff8A8A99)),
                            activeColor: const Color(0xff000050),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: const Color(0xffFFFFFF),
                            value: value2,
                            onChanged: (value) {
                              setState(() {
                                value2 = value!;
                              });
                            }),
                        Text(
                          "Parking",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff737380)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            side: const BorderSide(color: Color(0xff8A8A99)),
                            activeColor: const Color(0xff000050),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            checkColor: const Color(0xffFFFFFF),
                            value: value3,
                            onChanged: (value) {
                              setState(() {
                                value3 = value!;
                              });
                            }),
                        Text(
                          "WiFi",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xff737380)),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(color: Color(0xff8A8A99)),
                              activeColor: const Color(0xff000050),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: const Color(0xffFFFFFF),
                              value: value4,
                              onChanged: (value) {
                                setState(() {
                                  value4 = value!;
                                });
                              }),
                          Text(
                            "CCTV",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xff737380)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(color: Color(0xff8A8A99)),
                              activeColor: const Color(0xff000050),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: const Color(0xffFFFFFF),
                              value: value5,
                              onChanged: (value) {
                                setState(() {
                                  value5 = value!;
                                });
                              }),
                          Text(
                            "Cafeteria",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xff737380)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(color: Color(0xff8A8A99)),
                              activeColor: const Color(0xff000050),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              checkColor: const Color(0xffFFFFFF),
                              value: value6,
                              onChanged: (value) {
                                setState(() {
                                  value6 = value!;
                                });
                              }),
                          Text(
                            "Shawarma and Grills",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: const Color(0xff737380)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                SizedBox(
                  height: 35,
                  child: ReusableAddTextButton(
                    onTap: () {
                      showModalBottomSheet(
                          context: (context),
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.all(15),
                              // height: 150,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildTextField(
                                      "Add Amenities",
                                      null,
                                      8,
                                      56,
                                      Colors.white,
                                      const BorderSide(
                                          width: 1, color: Colors.black12),
                                      true),
                                  TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xffFFFFFF)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Color(0xff000050),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text(
                                        "Add",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff000050)),
                                      )),
                                  const Spacer(),
                                ],
                              ),
                            );
                          });
                    },
                    title: "Add more",
                    color: const Color(0xffE8E8EB),
                    fontColor: Colors.black,
                  ),
                ),
                const Spacer(),
              ],
            ),
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
            Text(
              "Room details",
              style: GoogleFonts.poppins(
                  color: const Color(0xff000050),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  buildTextField("Name of room", null, 8, 56, Colors.white,
                      const BorderSide(width: 1, color: Colors.black12), false),
                  const Gap(7),
                  buildTextField("Short description", null, 8, 56, Colors.white,
                      const BorderSide(width: 1, color: Colors.black12), false),
                  const Gap(7),
                  buildTextField("Available Seats", null, 8, 56, Colors.white,
                      const BorderSide(width: 1, color: Colors.black12), false),
                  const Gap(7),
                  DropdownMenu(
                    menuStyle: const MenuStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        elevation: MaterialStatePropertyAll(0)),
                    textStyle: GoogleFonts.poppins(
                        color: const Color(0xff0E0E1B),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    selectedTrailingIcon: const Icon(Iconsax.arrow_circle_up),
                    hintText: "Pricing Type",
                    trailingIcon: const Icon(Iconsax.arrow_circle_down),
                    width: MediaQuery.of(context).size.width * 0.88,
                    dropdownMenuEntries: const <DropdownMenuEntry>[
                      DropdownMenuEntry(
                          value: "hourly",
                          label: "Hourly",
                          trailingIcon: Icon(
                            Icons.radio_button_checked_outlined,
                            color: Colors.grey,
                          )),
                      DropdownMenuEntry(
                          value: "fixed",
                          label: "Fixed",
                          trailingIcon: Icon(
                            Icons.radio_button_checked_outlined,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  const Gap(7),
                  buildTextField("Available Seats", null, 8, 56, Colors.white,
                      const BorderSide(width: 1, color: Colors.black12), false),
                ],
              ),
            ),
            const Gap(30),
            Row(
              children: [
                SizedBox(
                  height: 35,
                  child: ReusableAddTextButton(
                    onTap: () {},
                    title: "Add more",
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
