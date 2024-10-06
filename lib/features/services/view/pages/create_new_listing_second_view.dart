import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/view/pages/create_new_listing_view.dart';
import 'package:tivi_tea/features/services/view/widgets/add_room_section.dart';
import 'package:tivi_tea/features/services/view/widgets/selected_images_view.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateNewListingSecondView extends StatelessWidget {
  final CreateListingType listingType;
  const CreateNewListingSecondView({super.key, required this.listingType});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(title: context.l10n.newListing),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (listingType == CreateListingType.workSpace) ...[
                Text(
                  context.l10n.spaceDetails,
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                AppTextField(hintText: context.l10n.nameOfSpace),
                AppTextField(hintText: context.l10n.shortDescription),
                AppTextField(hintText: context.l10n.addressOfSpace),
                const SpaceAmenitiesSection(),
                20.verticalSpace,
                const AddRoomSection(),
                20.verticalSpace,
              ] else ...[
                Text(
                  context.l10n.workToolDetails,
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                AppTextField(hintText: context.l10n.nameOfWorkTool),
                AppTextField(hintText: context.l10n.shortDescription),
                AppTextField(hintText: context.l10n.pickUpLocation),
                AppTextField(hintText: context.l10n.rentPrice),
                20.verticalSpace,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SpaceAmenitiesSection extends ConsumerWidget {
  const SpaceAmenitiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amentitiesNotifier = ref.read(amenitiesNotifierProvider.notifier);
    final amentities = ref.watch(amenitiesNotifierProvider).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.spaceAmenities,
          style: context.theme.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        20.verticalSpace,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            amentities.length,
            (index) {
              return SizedBox(
                width: 170.w,
                child: _AmenityCheckbox(
                  onChanged: () => amentitiesNotifier.toggleAmenity(
                    amentities[index].label,
                  ),
                  label: amentities[index].label,
                  isSelected: amentities[index].isSelected,
                ),
              );
            },
          ),
        ),
        20.verticalSpace,
        IntrinsicWidth(
          child: CreateListingButton(
            text: context.l10n.addMore,
            iconColor: Colors.black,
            textColor: Colors.black,
            backgroundColor: const Color(0xFFE8E8EB),
            onTap: () => _addNewAmenity(context),
          ),
        ),
        20.verticalSpace,
        const SelectedImagesView(),
      ],
    );
  }

  void _addNewAmenity(BuildContext context) {
    context.showCustomDialog(
      child: const _AddAmenityDialog(),
      horizontalPadding: 20,
      verticalPadding: 20,
    );
  }
}

class _AddAmenityDialog extends ConsumerStatefulWidget {
  const _AddAmenityDialog();
  @override
  ConsumerState<_AddAmenityDialog> createState() => __AddAmenityDialogState();
}

class __AddAmenityDialogState extends ConsumerState<_AddAmenityDialog> {
  String newAmenity = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: context.l10n.addAmenities,
          onChange: (value) {
            newAmenity = value;
            setState(() {});
          },
        ),
        AppButton(
          backgroundColor: Colors.white,
          borderColor: context.theme.primaryColor,
          buttonText: context.l10n.add,
          textColor: context.theme.primaryColor,
          onPressed: () {
            final notifier = ref.read(amenitiesNotifierProvider.notifier);
            notifier.addNewAmenity(newAmenity);
            context.pop();
          },
        )
      ],
    );
  }
}

class _AmenityCheckbox extends StatefulWidget {
  final VoidCallback onChanged;
  final String label;
  final bool isSelected;
  const _AmenityCheckbox({
    required this.label,
    required this.onChanged,
    this.isSelected = false,
  });

  @override
  State<_AmenityCheckbox> createState() => __AmenityCheckboxState();
}

class __AmenityCheckboxState extends State<_AmenityCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? context.theme.primaryColor
                    : Colors.white,
                border: Border.all(
                  color: const Color(0xFFD8D8DD),
                ),
                borderRadius: BorderRadiusDirectional.circular(5),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                widget.label,
                style: context.theme.textTheme.displayLarge?.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xFF737380),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
