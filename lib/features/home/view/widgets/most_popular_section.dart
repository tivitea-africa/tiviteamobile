import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.mostPopular,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
