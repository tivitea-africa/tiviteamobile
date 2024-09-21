import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class WelcomeBackText extends StatelessWidget {
  final bool dashboard;
  const WelcomeBackText({super.key, this.dashboard = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dashboard ? context.l10n.dashboard : context.l10n.welcomeBack,
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 20.sp,
              color: context.theme.primaryColor,
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              final user = ref.read(currentUserProvider);
              return Text(
                context.l10n.hiUser(user.firstName ?? ''),
                style: context.theme.textTheme.labelMedium?.copyWith(
                  color: const Color(0xFF737380),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
