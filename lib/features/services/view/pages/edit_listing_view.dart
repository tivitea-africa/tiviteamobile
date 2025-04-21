import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/widgets/other_category_dropdown.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class EditListingView extends ConsumerStatefulWidget {
  const EditListingView({super.key});

  @override
  ConsumerState<EditListingView> createState() => _EditListingViewState();
}

class _EditListingViewState extends ConsumerState<EditListingView> {
  String categoryId = '';
  @override
  void initState() {
    super.initState();
    ref.read(servicesNotiferProvider.notifier).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    const routePath =
        '${AppRoutes.myListingView}/${AppRoutes.editListingSecondView}';

    final listing = ref.watch(partnerServicesNotiferProvider.select(
      (value) => value.selectedListing,
    ));

    final selectedListingType =
        listing?.listingType?.enumType ?? CreateListingType.workTool;
    return AppScaffold(
      appbar: const CustomAppBar(title: 'Edit Listing'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            30.verticalSpace,
            _ListingTypeContainer(
              listingType: selectedListingType,
              onTap: (_) {},
              isSelected: true,
            ),
            20.verticalSpace,
            OtherCategoryDropdown(
              initialValue: listing?.category?.name ?? '',
              onCategorySelected: (value) {
                categoryId = value;
                setState(() {});
              },
            ),
            30.verticalSpace,
            AppButton(
              isEnabled: listing?.category?.id != null || categoryId.isNotEmpty,
              onPressed: () => context.push(
                routePath,
                extra: [selectedListingType, categoryId],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListingTypeContainer extends StatelessWidget {
  final CreateListingType listingType;
  final bool isSelected;
  final void Function(CreateListingType) onTap;
  const _ListingTypeContainer({
    required this.listingType,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(listingType),
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
          child: switch (listingType) {
            CreateListingType.workSpace => Row(
                children: [
                  AppSvgWidget(
                    path: Assets.svgs.userGroup,
                    color: isSelected
                        ? context.theme.primaryColor
                        : const Color(0xFF77797D),
                  ),
                  10.horizontalSpace,
                  Text(context.l10n.coWorkingSpace),
                ],
              ),
            CreateListingType.workTool => Row(
                children: [
                  AppSvgWidget(
                    path: Assets.svgs.suitcase,
                    color: isSelected
                        ? context.theme.primaryColor
                        : const Color(0xFF77797D),
                  ),
                  10.horizontalSpace,
                  Text(context.l10n.workTool),
                ],
              ),
            CreateListingType.otherListing => Row(
                children: [
                  AppSvgWidget(
                    path: Assets.svgs.box,
                    color: isSelected
                        ? context.theme.primaryColor
                        : const Color(0xFF77797D),
                  ),
                  10.horizontalSpace,
                  Text(context.l10n.otherListing),
                ],
              ),
          },
        ),
      ),
    );
  }
}
