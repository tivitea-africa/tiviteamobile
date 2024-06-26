import 'package:flutter/material.dart';
import 'package:tivi_tea/core/const/app_colors.dart';

class OptionsSelector extends StatefulWidget {
  const OptionsSelector({Key? key}) : super(key: key);

  @override
  State<OptionsSelector> createState() => _OptionsSelectorState();
}

class _OptionsSelectorState extends State<OptionsSelector> {
  // Define the days of the week and their corresponding dates
  final options = [
    'Co-working Space',
    'Fashion',
    'Photography',
    'Fashion', // Note: 'Fashion' is repeated in your original list
    'Technology',
  ];

  // Initially highlighted day and date
  int highlightedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Make the list scroll horizontally
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(options.length, (index) {
            final isSelected = index == highlightedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  highlightedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors
                          .deepBlue // Change to your preferred selected color
                      : const Color.fromARGB(255, 212, 212, 212),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
