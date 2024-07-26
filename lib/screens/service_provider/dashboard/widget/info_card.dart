import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_colors.dart';

class InfoCard extends StatelessWidget {
  final String count;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  InfoCard({
    required this.count,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 162,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  count,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepBlue),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(icon, size: 16, color: iconColor),
                ),
              ],
            ),
            const Gap(4),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
