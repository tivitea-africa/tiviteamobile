import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String selectedRole = 'Service Provider';
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.deepBlue,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.deepBlue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(43),
            const Center(
              child: Icon(
                Icons.lock_outline,
                size: 29,
                color: AppColors.deepBlue,
              ),
            ),
            const Gap(16),
            const Text(
              'Login to access your account',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.fontColor,
              ),
            ),
            const Gap(20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const Gap(16),
            TextFormField(
              obscureText: true, // To hide the password input
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Iconsax.eye : Iconsax.eye_slash,
                    color: Colors.grey[400]!,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const Gap(16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.danger,
                ),
              ),
            ),
            const Gap(24),
            FullButton(
              text: 'Login',
              width: double.infinity,
              height: 44,
              onPressed: () {
                context.go('/bottomNav');
              },
              color: Colors.white,
              bgColor: AppColors.deepBlue,
            ),
            const Gap(24),
            ImgTxtButton(
              bgColor: Colors.transparent,
              height: 44,
              onPressed: () {},
              width: double.infinity,
              image: PlaceholderAssets.google,
              color: Colors.grey,
              text: 'Login with Google',
              fontSize: 14,
            ),
            const Gap(64),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: TextStyle(
                        color: AppColors.deepBlue, // Navy blue color
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: AppColors.goldOrng, // Orange color
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
