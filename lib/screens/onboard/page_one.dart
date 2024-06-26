import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.fontColor,
              ),
            ),
          ),
          const Gap(43),
          Container(
            width: 250,
            height: 235,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  PlaceholderAssets.onbrd1,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(80),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Discover Your Perfect\n',
                    style: TextStyle(
                      color: AppColors.deepBlue, // Navy blue color
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Workspace',
                    style: TextStyle(
                      color: AppColors.goldOrng, // Orange color
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' or ',
                    style: TextStyle(
                      color: AppColors.deepBlue, // Orange color
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Tool',
                    style: TextStyle(
                      color: AppColors.goldOrng, // Orange color
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(24),
          const Text(
            'Be it workspace, or work tool, find\nwhat you need for work on our platform.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
