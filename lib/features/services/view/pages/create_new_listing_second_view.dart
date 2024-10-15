import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/image_picker_notifier.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/model/post_working_space_model.dart';
import 'package:tivi_tea/features/services/view/widgets/add_room_section.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/features/services/view/widgets/selected_images_view.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/workspace_room_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateNewListingSecondView extends StatefulWidget {
  final CreateListingType listingType;
  final String categoryId;
  const CreateNewListingSecondView({
    super.key,
    required this.listingType,
    required this.categoryId,
  });

  @override
  State<CreateNewListingSecondView> createState() =>
      _CreateNewListingSecondViewState();
}

class _CreateNewListingSecondViewState
    extends State<CreateNewListingSecondView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescription = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pickUpLocation = TextEditingController();
  //TextEditingController pricingType = TextEditingController();
  String pricingType = PricingType.fixed.name;

  @override
  void dispose() {
    nameController.dispose();
    shortDescription.dispose();
    address.dispose();
    pickUpLocation.dispose();
    //pricingType.dispose();
    super.dispose();
  }

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
              if (widget.listingType == CreateListingType.workSpace) ...[
                Text(
                  context.l10n.spaceDetails,
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: nameController,
                  hintText: context.l10n.nameOfSpace,
                ),
                AppTextField(
                  controller: shortDescription,
                  hintText: context.l10n.shortDescription,
                ),
                AppTextField(
                  controller: address,
                  hintText: context.l10n.addressOfSpace,
                ),
                CustomDropdown(
                  onOptionSelected: (value) {
                    pricingType = value;
                    setState(() {});
                  },
                  items: PricingTypeExt.stringValues,
                ),
                20.verticalSpace,
                const SpaceAmenitiesSection(),
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
              if (widget.listingType == CreateListingType.workSpace) ...[
                20.verticalSpace,
                const AddRoomSection(),
                20.verticalSpace,
              ],
              20.verticalSpace,
              const SelectedImagesView(),
              70.verticalSpace,
              Consumer(
                builder: (context, ref, _) {
                  final loadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.postLoadState,
                    ),
                  );
                  final cloudinaryLoadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.cloudinaryUploadState,
                    ),
                  );
                  final isLoading = loadState == LoadState.loading ||
                      cloudinaryLoadState == LoadState.loading;
                  return Center(
                    child: AppButton(
                      isLoading: isLoading,
                      buttonText: context.l10n.saveAndPublish,
                      onPressed: () => _submit(ref),
                    ),
                  );
                },
              ),
              10.verticalSpace,
              Consumer(builder: (context, ref, _) {
                return AppButton(
                  buttonText: context.l10n.saveToDraft,
                  backgroundColor: Colors.white,
                  textColor: context.theme.primaryColor,
                  borderColor: context.theme.primaryColor,
                  onPressed: () {},
                );
              }),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _submit(WidgetRef ref) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final rooms = ref.watch(workspaceRoomNotifierProvider);
    final amenities = ref.watch(amenitiesNotifierProvider);
    final selectedAmenities = amenities
        .where((amenity) => amenity.isSelected)
        .map((amenity) => amenity.label)
        .toList();
    final images = await _uploadImages(ref);

    final data = PostWorkingSpaceModel(
      name: nameController.text,
      description: shortDescription.text,
      address: address.text,
      amenities: selectedAmenities,
      categoryId: widget.categoryId,
      room: rooms,
      images: images,
      listingType: widget.listingType.requestBodyName,
      pricingOption: pricingType,
      footSoldier: "False",
    );

    notifier.postWorkSpace(
      data,
      onSuccess: () {
        ref.read(workspaceRoomNotifierProvider.notifier).clearRooms();
        ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();
        context.go(AppRoutes.myListingView);
      },
    );
  }

  Future<List<String>> _uploadImages(WidgetRef ref) async {
    final images = ref.watch(imagePickerNotifierProvider);
    if (images.isEmpty) {
      return [];
    }
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final imageUrls = await notifier.uploadImages(images);

    return imageUrls;
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
