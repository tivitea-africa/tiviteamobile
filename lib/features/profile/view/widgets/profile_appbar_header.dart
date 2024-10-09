import 'package:flutter/material.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class ProfileAppbarHeader extends StatelessWidget {
  const ProfileAppbarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: context.theme.primaryColor,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Assets.images.profileAppbarHeaderBackgroundImage.image(
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
