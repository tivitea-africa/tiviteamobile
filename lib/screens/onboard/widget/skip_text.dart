import 'package:flutter/material.dart';
import 'package:tivi_tea/screens/auth/reguster/options_register.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OptionsRegisterScreen(),
            ),
          );
        },
        child: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
