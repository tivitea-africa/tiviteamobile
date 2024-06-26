import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';

class OPtionsRegistserScreen extends StatefulWidget {
  const OPtionsRegistserScreen({super.key});

  @override
  State<OPtionsRegistserScreen> createState() => _OPtionsRegistserScreenState();
}

class _OPtionsRegistserScreenState extends State<OPtionsRegistserScreen> {
  String selectedRole = 'Service Provider';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(80),
            const Text(
              'How do you want to \nregister?',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28,
                color: AppColors.deepBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(62),
            buildRadioListTile(
              title: 'Service Provider',
              value: 'Service Provider',
              groupValue: selectedRole,
              icon: Icons.business_center_outlined,
            ),
            const Gap(16),
            buildRadioListTile(
              title: 'Customer',
              value: 'Customer',
              groupValue: selectedRole,
              icon: Icons.person_outline,
            ),
            const Gap(232),
            FullButton(
              text: 'Continue',
              width: double.infinity,
              height: 44,
              onPressed: () {},
              color: Colors.white,
              bgColor: AppColors.deepBlue,
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }

  Widget buildRadioListTile({
    required String title,
    required String value,
    required String groupValue,
    required IconData icon,
  }) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: value == groupValue ? AppColors.deepBlue : Colors.transparent,
          width: 1.5,
        ),
        color: const Color(0xFFF9F9F9),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: value == groupValue ? Colors.black : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: value == groupValue ? Colors.black : Colors.grey,
          ),
        ),
        trailing: Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedRole = newValue!;
            });
          },
          activeColor: AppColors.deepBlue,
        ),
        onTap: () {
          setState(() {
            selectedRole = value;
          });
        },
      ),
    );
  }
}
