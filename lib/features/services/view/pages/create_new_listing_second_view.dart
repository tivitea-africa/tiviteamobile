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
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/model/post_listing_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';
import 'package:tivi_tea/features/services/view/widgets/add_room_section.dart';
import 'package:tivi_tea/features/services/view/widgets/selected_images_view.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/workspace_room_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
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
  TextEditingController amount = TextEditingController();
  String pricingType = PricingType.fixed.name;
  ValueNotifier<bool> hasFootSoldier = ValueNotifier(false);

  @override
  void dispose() {
    nameController.dispose();
    shortDescription.dispose();
    address.dispose();
    pickUpLocation.dispose();
    amount.dispose();
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
                SelectedImagesView(listingType: widget.listingType),
              ] else ...[
                Text(
                  context.l10n.workToolDetails,
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                AppTextField(
                  controller: nameController,
                  hintText: context.l10n.nameOfWorkTool,
                ),
                AppTextField(
                  controller: shortDescription,
                  hintText: context.l10n.shortDescription,
                ),
                AppTextField(
                  controller: pickUpLocation,
                  hintText: context.l10n.pickUpLocation,
                  suffixIcon: AppSvgWidget(
                    path: Assets.svgs.mapMarker,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                AppTextField(
                  controller: amount,
                  hintText: context.l10n.rentPrice,
                  keyboardType: TextInputType.number,
                ),
                20.verticalSpace,
              ],
              if (widget.listingType == CreateListingType.workSpace) ...[
                50.verticalSpace,
                const AddRoomSection(),
              ] else ...[
                20.verticalSpace,
                SelectedImagesView(listingType: widget.listingType),
                20.verticalSpace,
                Text(
                  'Add Foot Soldier',
                  style: context.theme.textTheme.displayLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                10.verticalSpace,
                ValueListenableBuilder(
                  valueListenable: hasFootSoldier,
                  builder: (context, value, child) => Switch.adaptive(
                    value: value,
                    onChanged: (value) => hasFootSoldier.value = value,
                  ),
                ),
              ],
              70.verticalSpace,
              Consumer(
                builder: (context, ref, _) {
                  final loadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.postLoadState,
                    ),
                  );
                  final postWorkToolLoadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.postWorkToolLoadState,
                    ),
                  );
                  final cloudinaryLoadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.cloudinaryUploadState,
                    ),
                  );
                  final isLoading = loadState == LoadState.loading ||
                      cloudinaryLoadState == LoadState.loading ||
                      postWorkToolLoadState == LoadState.loading;
                  return Center(
                    child: AppButton(
                      isLoading: isLoading,
                      buttonText: context.l10n.saveAndPublish,
                      onPressed: () =>
                          widget.listingType == CreateListingType.workSpace
                              ? _submit(ref)
                              : _submitWorkTool(ref),
                    ),
                  );
                },
              ),
              10.verticalSpace,
              Consumer(
                builder: (context, ref, _) {
                  return AppButton(
                    buttonText: context.l10n.saveToDraft,
                    backgroundColor: Colors.white,
                    textColor: context.theme.primaryColor,
                    borderColor: context.theme.primaryColor,
                    onPressed: () {},
                  );
                },
              ),
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

    final data = PostListingModel(
      name: nameController.text,
      description: shortDescription.text,
      address: address.text,
      amenities: selectedAmenities,
      categoryId: widget.categoryId,
      room: rooms,
      images: images,
      listingType: widget.listingType.requestBodyName,
      pricingOption: pricingType,
      //footSoldier: "False",
    );

    notifier.postWorkSpace(
      data,
      onSuccess: () {
        ref.read(workspaceRoomNotifierProvider.notifier).clearRooms();
        ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();

        _showSuccessDialog();
      },
    );
  }

  void _navigateToCreateFootSoldierView(WidgetRef ref, WorkToolListing model) {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    notifier.saveWorkToolListing(model);
    context.push(AppRoutes.createFootSoldierView);
  }

  void _submitWorkTool(WidgetRef ref) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final images = await _uploadImages(ref);

    final data = WorkToolListing(
      name: nameController.text,
      description: shortDescription.text,
      address: address.text,
      categoryId: widget.categoryId,
      images: images,
      listingType: widget.listingType.requestBodyName,
      footSoldier: hasFootSoldier.value ? "True" : "False",
      amount: num.tryParse(amount.text),
    );

    if (hasFootSoldier.value) {
      _navigateToCreateFootSoldierView(ref, data);
    } else {
      notifier.postToolOrOtherListing(
        data,
        onSuccess: () {
          ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();
          _showSuccessDialog();
        },
      );
    }
  }

  void _showSuccessDialog() {
    context.showCustomDialog(
      dismissible: false,
      child: AppSuccessContent(
        title: 'Success',
        subtitle:
            "Your post has been created and will be saved as 'Draft' until the admin approves it.",
        buttonText: context.l10n.continue_,
        onPressed: () {
          context.pop();
          context.go(AppRoutes.myListingView);
        },
      ),
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
          context.l10n.amenities,
          style: context.theme.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        20.verticalSpace,
        Column(
          children: List.generate(
            (amentities.length / 2).ceil(),
            (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: _AmenityCheckbox(
                        onChanged: () => amentitiesNotifier.toggleAmenity(
                          amentities[rowIndex * 2].label,
                        ),
                        label: amentities[rowIndex * 2].label,
                        isSelected: amentities[rowIndex * 2].isSelected,
                      ),
                    ),
                  ),
                  if (rowIndex * 2 + 1 < amentities.length)
                    Expanded(
                      child: SizedBox(
                        child: _AmenityCheckbox(
                          onChanged: () => amentitiesNotifier.toggleAmenity(
                            amentities[rowIndex * 2 + 1].label,
                          ),
                          label: amentities[rowIndex * 2 + 1].label,
                          isSelected: amentities[rowIndex * 2 + 1].isSelected,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        20.verticalSpace,
        InkWell(
          onTap: () => _addNewAmenity(context),
          child: Row(
            children: [
              Icon(Icons.add_rounded, color: context.theme.primaryColor),
              5.horizontalSpace,
              Text(
                context.l10n.amenities,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 12.sp,
                  color: context.theme.primaryColor,
                ),
              ),
            ],
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
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  fontSize: 12.sp,
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
