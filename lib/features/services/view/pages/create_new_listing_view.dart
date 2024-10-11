import 'package:flutter/material.dart';
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
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateNewListingView extends StatefulWidget {
  const CreateNewListingView({super.key});

  @override
  State<CreateNewListingView> createState() => _CreateNewListingViewState();
}

class _CreateNewListingViewState extends State<CreateNewListingView> {
  CreateListingType selectedListingType = CreateListingType.workSpace;
  String categoryId = '';
  @override
  Widget build(BuildContext context) {
    const routePath =
        '${AppRoutes.myListingView}/${AppRoutes.createListingSecondView}';
    return AppScaffold(
      appbar: CustomAppBar(title: context.l10n.newListing),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            30.verticalSpace,
            Text(
              context.l10n.whatToList,
              style: context.theme.textTheme.displayLarge?.copyWith(
                color: context.theme.primaryColor,
                fontSize: 20.sp,
              ),
            ),
            40.verticalSpace,
            _ListingTypeContainer(
              listingType: CreateListingType.workSpace,
              onTap: (type) => _selectUserType(type),
              isSelected: selectedListingType == CreateListingType.workSpace,
            ),
            10.verticalSpace,
            _ListingTypeContainer(
              listingType: CreateListingType.workTool,
              onTap: (type) => _selectUserType(type),
              isSelected: selectedListingType == CreateListingType.workTool,
            ),
            10.verticalSpace,
            _ListingTypeContainer(
              listingType: CreateListingType.otherListing,
              onTap: (type) => _selectUserType(type),
              isSelected: selectedListingType == CreateListingType.otherListing,
            ),
            20.verticalSpace,
            OtherCategoryDropdown(
              onCategorySelected: (value) {
                categoryId = value;
                setState(() {});
              },
            ),
            30.verticalSpace,
            AppButton(
              isEnabled: categoryId.isNotEmpty,
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

  void _selectUserType(CreateListingType type) {
    if (selectedListingType != type) {
      selectedListingType = type;
      setState(() {});
    }
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
