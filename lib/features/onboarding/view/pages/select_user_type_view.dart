import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_onboarding_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/onboarding/model/enums/enums.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SelectUserTypeView extends StatefulWidget {
  const SelectUserTypeView({super.key});

  @override
  State<SelectUserTypeView> createState() => _SelectUserTypeViewState();
}

class _SelectUserTypeViewState extends State<SelectUserTypeView> {
  AppUserType selectedAppUserType = AppUserType.serviceProvier;
  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.howToContinue,
            style: context.theme.textTheme.titleMedium,
          ),
          20.verticalSpace,
          _UserTypeContainer(
            userType: AppUserType.guest,
            onTap: (type) => _selectUserType(type),
            isSelected: selectedAppUserType == AppUserType.guest,
          ),
          10.verticalSpace,
          _UserTypeContainer(
            userType: AppUserType.serviceProvier,
            onTap: (type) => _selectUserType(type),
            isSelected: selectedAppUserType == AppUserType.serviceProvier,
          ),
          10.verticalSpace,
          _UserTypeContainer(
            userType: AppUserType.customer,
            onTap: (type) => _selectUserType(type),
            isSelected: selectedAppUserType == AppUserType.customer,
          ),
          20.verticalSpace,
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: context.l10n.alreadyHaveAccount,
                style: context.theme.textTheme.displaySmall,
                children: [
                  TextSpan(
                    text: context.l10n.login,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      color: const Color(0xFFEC8305),
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.push(AppRoutes.loginView),
                  ),
                ],
              ),
            ),
          ),
          100.verticalSpace,
          AppButton(onPressed: _navigateToCreateAccountView),
        ],
      ),
    );
  }

  void _selectUserType(AppUserType type) {
    if (selectedAppUserType != type) {
      selectedAppUserType = type;
      setState(() {});
    }
  }

  void _navigateToCreateAccountView() {
    switch (selectedAppUserType) {
      case AppUserType.serviceProvier:
        context.push(AppRoutes.createServiceProviderAccount);
      case AppUserType.guest:
        context.go(AppRoutes.homeView);
      default:
        context.push(AppRoutes.createCustomerAccount);
    }
  }
}

class _UserTypeContainer extends StatelessWidget {
  final AppUserType userType;
  final bool isSelected;
  final void Function(AppUserType) onTap;
  const _UserTypeContainer({
    required this.userType,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(userType),
      child: AnimatedScale(
        scale: isSelected ? 1 : 0.95,
        duration: const Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: context.width,
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  isSelected ? context.theme.primaryColor : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              if (userType == AppUserType.serviceProvier) ...[
                AppSvgWidget(path: Assets.svgs.suitcase),
                10.horizontalSpace,
                Text(context.l10n.serviceProvider),
              ] else if (userType == AppUserType.guest) ...[
                AppSvgWidget(path: Assets.svgs.listingDrawerIcon),
                10.horizontalSpace,
                Text(context.l10n.browseListings),
              ] else ...[
                AppSvgWidget(path: Assets.svgs.profileIcon),
                10.horizontalSpace,
                Text(context.l10n.customer),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
