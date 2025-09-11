import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/model/extensions/room_model_extension.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/model/post_listing_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view/widgets/add_room_section.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/workspace_room_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class EditListingSecondView extends ConsumerStatefulWidget {
  final CreateListingType listingType;
  final String categoryId;
  const EditListingSecondView({
    super.key,
    required this.listingType,
    required this.categoryId,
  });

  @override
  ConsumerState<EditListingSecondView> createState() =>
      _EditListingSecondViewState();
}

class _EditListingSecondViewState extends ConsumerState<EditListingSecondView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescription = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pickUpLocation = TextEditingController();
  TextEditingController amount = TextEditingController();
  String pricingType = PricingType.fixed.name;
  ValueNotifier<bool> hasFootSoldier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final notifier = ref.read(workspaceRoomNotifierProvider.notifier);

      final selectedListing = ref.watch(partnerServicesNotiferProvider.select(
        (value) => value.selectedListing,
      ));

      notifier.addRoomFromList(
        selectedListing?.rooms?.map((e) => e.toWorkspaceRoomModel()).toList() ??
            [],
      );

      // Initialize global amenities with selected listing amenities
      if (selectedListing?.amenities != null) {
        final amenitiesNotifier = ref.read(amenitiesNotifierProvider.notifier);
        amenitiesNotifier.initializeWithSelectedAmenities(selectedListing!.amenities!);
      }
      
      nameController = TextEditingController(text: selectedListing?.name);
      shortDescription = TextEditingController(
        text: selectedListing?.description,
      );
      address = TextEditingController(text: selectedListing?.address);
      pickUpLocation = TextEditingController(text: selectedListing?.address);
      amount = TextEditingController(text: selectedListing?.amount.toString());
      pricingType = selectedListing?.pricingOption ?? PricingType.fixed.name;
      hasFootSoldier.value = selectedListing?.footSoldier ?? false;
      setState(() {});
    });
  }

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
    final selectedListing = ref.watch(partnerServicesNotiferProvider.select(
      (value) => value.selectedListing,
    ));
    return AppScaffold(
      appbar: CustomAppBar(
        title: 'Edit Listing',
        onTap: () {
          ref.read(workspaceRoomNotifierProvider.notifier).clearRooms();
          context.pop();
        },
      ),
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
                //SelectedImagesView(listingType: widget.listingType),
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
                20.verticalSpace,
                const SpaceAmenitiesSection(),
                30.verticalSpace,
                const AddRoomSection(),
              ] else ...[
                20.verticalSpace,
                //SelectedImagesView(listingType: widget.listingType),
                20.verticalSpace,
                Text(
                  'Has Foot Soldier',
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
                  final editWorkToolLoadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.editWorkToolLoadState,
                    ),
                  );
                  final editWorkSpaceLoadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.editWorkSpaceLoadState,
                    ),
                  );
                  final isLoading =
                      editWorkToolLoadState == LoadState.loading ||
                          editWorkSpaceLoadState == LoadState.loading;
                  return ValueListenableBuilder(
                    valueListenable: hasFootSoldier,
                    builder: (context, value, child) {
                      return Center(
                        child: AppButton(
                          isLoading: isLoading,
                          buttonText: 'Edit Listing',
                          onPressed: () => selectedListing != null
                              ? (widget.listingType == CreateListingType.workSpace
                                  ? _editWorkSpace(ref, selectedListing.id!, selectedListing)
                                  : _editWorkTool(ref, selectedListing.id!, selectedListing))
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
              // 10.verticalSpace,
              // Consumer(
              //   builder: (context, ref, _) {
              //     return AppButton(
              //       buttonText: context.l10n.saveToDraft,
              //       backgroundColor: Colors.white,
              //       textColor: context.theme.primaryColor,
              //       borderColor: context.theme.primaryColor,
              //       onPressed: () {},
              //     );
              //   },
              // ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build PostListingModel with only modified fields (no null values)
  PostListingModel _buildModifiedWorkSpaceModel(ListingResponseModel selectedListing) {
    final rooms = ref.watch(workspaceRoomNotifierProvider);
    final amenities = ref.watch(amenitiesNotifierProvider);
    final selectedAmenities = amenities
        .where((amenity) => amenity.isSelected)
        .map((amenity) => amenity.label)
        .toList();
    
    // Build the model with only modified fields
    final Map<String, dynamic> modelData = {};
    
    // Always include these fields
    modelData['category_id'] = widget.categoryId;
    
    // Only include modified fields
    if (nameController.text != selectedListing.name) {
      modelData['name'] = nameController.text;
    }
    if (shortDescription.text != selectedListing.description) {
      modelData['description'] = shortDescription.text;
    }
    if (address.text != selectedListing.address) {
      modelData['address'] = address.text;
    }
    if (pricingType != selectedListing.pricingOption) {
      modelData['pricing_option'] = pricingType;
    }
    if (_amenitiesChanged(selectedListing.amenities, selectedAmenities)) {
      modelData['amenities'] = selectedAmenities;
    }
    if (_roomsChanged(selectedListing.rooms, rooms.toList())) {
      modelData['room'] = rooms.toList();
    }

    // Create model with only the fields present in the map
    return PostListingModel(
      // categoryId: modelData['category_id'],
      name: modelData['name'],
      description: modelData['description'],
      address: modelData['address'],
      pricingOption: modelData['pricing_option'],
      amenities: modelData['amenities']?.cast<String>(),
      room: modelData['room']?.cast<WorkspaceRoomModel>(),
    );
  }

  // Helper method to build WorkToolListing with only modified fields (no null values)
  WorkToolListing _buildModifiedWorkToolModel(ListingResponseModel selectedListing) {
    // Build the model with only modified fields
    final Map<String, dynamic> modelData = {};
    
    // Always include these fields
    modelData['category_id'] = widget.categoryId;
    
    // Only include modified fields
    if (nameController.text != selectedListing.name) {
      modelData['name'] = nameController.text;
    }
    if (shortDescription.text != selectedListing.description) {
      modelData['description'] = shortDescription.text;
    }
    if (address.text != selectedListing.address) {
      modelData['address'] = address.text;
    }
    if (hasFootSoldier.value != selectedListing.footSoldier) {
      modelData['foot_soldier'] = hasFootSoldier.value ? "True" : "False";
    }
    if (amount.text != selectedListing.amount?.toString()) {
      modelData['amount'] = num.tryParse(amount.text);
    }

    // Create model with only the fields present in the map
    return WorkToolListing(
      categoryId: modelData['category_id'],
      name: modelData['name'],
      description: modelData['description'],
      address: modelData['address'],
      footSoldier: modelData['foot_soldier'],
      amount: modelData['amount'],
    );
  }

  // Helper methods to check if fields have changed
  bool _amenitiesChanged(List<String>? original, List<String> current) {
    if (original == null && current.isEmpty) return false;
    if (original == null || current.isEmpty) return true;
    
    // Sort both lists for comparison
    final originalSorted = List<String>.from(original)..sort();
    final currentSorted = List<String>.from(current)..sort();
    
    return originalSorted.toString() != currentSorted.toString();
  }
  
  bool _roomsChanged(List<Room>? original, List<WorkspaceRoomModel> current) {
    if (original == null && current.isEmpty) return false;
    if (original == null || current.isEmpty) return true;
    
    // Convert original rooms to WorkspaceRoomModel for comparison
    final originalRooms = original.map((r) => r.toWorkspaceRoomModel()).toList();
    final originalJson = originalRooms.map((r) => r.toJson()).toList();
    final currentJson = current.map((r) => r.toJson()).toList();
    
    return originalJson.toString() != currentJson.toString();
  }

  void _editWorkSpace(WidgetRef ref, String listingId, ListingResponseModel selectedListing) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    //final images = await _uploadImages(ref);

    // Build model with only modified fields
    final data = _buildModifiedWorkSpaceModel(selectedListing);

    if (kDebugMode) {
      print('Modified fields only:');
      print(data.toJson());
    }

    notifier.editWorkSpace(
      listingId,
      data,
      onSuccess: () {
        ref.read(workspaceRoomNotifierProvider.notifier).clearRooms();
        ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();

        _showSuccessDialog();
      },
      onError: (error) => context.showError(error),
    );
  }

  void _editWorkTool(WidgetRef ref, String listingId, ListingResponseModel selectedListing) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    //final images = await _uploadImages(ref);

    // Build model with only modified fields
    final data = _buildModifiedWorkToolModel(selectedListing);

    if (kDebugMode) {
      print('Modified fields only:');
      print(data.toJson());
    }

    notifier.editWorkTool(
      listingId,
      data,
      onSuccess: () {
        ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();
        _showSuccessDialog();
      },
      onError: (error) => context.showError(error),
    );
  }

  void _showSuccessDialog() {
    context.showCustomDialog(
      dismissible: false,
      child: AppSuccessContent(
        title: 'Success',
        subtitle: "Your post has been edited successfully",
        buttonText: context.l10n.continue_,
        onPressed: () {
          context.pop();
          context.go(AppRoutes.myListingView);
        },
      ),
    );
  }

  // Future<List<String>> _uploadImages(WidgetRef ref) async {
  //   final images = ref.watch(imagePickerNotifierProvider);
  //   if (images.isEmpty) {
  //     return [];
  //   }
  //   final notifier = ref.read(partnerServicesNotiferProvider.notifier);
  //   final imageUrls = await notifier.uploadImages(images);

  //   return imageUrls;
  // }
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

