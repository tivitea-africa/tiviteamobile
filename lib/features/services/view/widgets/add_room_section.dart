import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/features/services/view/widgets/select_room_images_view.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';
import 'package:tivi_tea/features/services/view_model/room_image_selector_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/features/services/view_model/workspace_room_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class AddRoomSection extends StatelessWidget {
  const AddRoomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.package,
          style: context.theme.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        30.verticalSpace,
        Column(
          children: [
            Consumer(
              builder: (context, ref, _) {
                final rooms = ref.watch(workspaceRoomNotifierProvider);
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: rooms.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (ctx, i) => 10.verticalSpace,
                  itemBuilder: (ctx, i) => _RoomContainer(
                    index: i,
                    room: rooms.elementAt(i),
                  ),
                );
              },
            ),
          ],
        ),
        50.verticalSpace,
        Consumer(
          builder: (context, ref, _) {
            final notifier = ref.read(workspaceRoomNotifierProvider.notifier);
            return IntrinsicWidth(
              child: CreateListingButton(
                text: context.l10n.addPackage,
                iconColor: Colors.black,
                textColor: Colors.black,
                backgroundColor: const Color(0xFFE8E8EB),
                onTap: () => notifier.addRoom(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final bool isDeleteButton;
  const _SaveButton({
    this.onTap,
    required this.icon,
    this.isDeleteButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isDeleteButton ? AppColors.danger : context.theme.primaryColor,
          ),
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Row(
          children: [
            icon,
            5.horizontalSpace,
            Text(
              isDeleteButton ? 'Delete' : 'Save',
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontSize: 12.sp,
                color: isDeleteButton
                    ? AppColors.danger
                    : context.theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomContainer extends StatefulWidget {
  final WorkspaceRoomModel? room;
  final int index;
  const _RoomContainer({required this.index, this.room});

  @override
  State<_RoomContainer> createState() => __RoomContainerState();
}

class __RoomContainerState extends State<_RoomContainer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();
  final TextEditingController maxCapacityController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String pricingType = PricingType.fixed.name;

  bool isLoading = false;
  bool isSaved = false;
  bool canSave = false;

  @override
  void initState() {
    super.initState();
    if (widget.room != null) {
      nameController.text = widget.room?.name ?? '';
      shortDescriptionController.text = widget.room?.description ?? '';
      maxCapacityController.text = widget.room?.maxCapacity != null
          ? widget.room?.maxCapacity.toString() ?? ''
          : '';
      amountController.text = widget.room?.amount != null
          ? widget.room?.amount.toString() ?? ''
          : '';

      setState(() {});
    }

    Listenable.merge([
      nameController,
      shortDescriptionController,
      maxCapacityController,
      amountController,
    ]).addListener(toogleCanSave);
  }

  void toogleCanSave() {
    canSave = nameController.text.isNotEmpty &&
        shortDescriptionController.text.isNotEmpty &&
        maxCapacityController.text.isNotEmpty &&
        amountController.text.isNotEmpty;

    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    shortDescriptionController.dispose();
    maxCapacityController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFCCCCDC),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          AppTextField(
            controller: nameController,
            hintText: context.l10n.packageName,
          ),
          AppTextField(
            controller: shortDescriptionController,
            hintText: context.l10n.packageShortDesc,
          ),
          AppTextField(
            controller: maxCapacityController,
            hintText: context.l10n.numberOfPeople,
            keyboardType: TextInputType.number,
          ),
          CustomDropdown(
            onOptionSelected: (value) {
              pricingType = value;
              setState(() {});
            },
            items: PricingTypeExt.stringValues,
          ),
          20.verticalSpace,
          AppTextField(
            controller: amountController,
            hintText: context.l10n.price,
            keyboardType: TextInputType.number,
          ),
          RoomAmenitiesSection(
            roomIndex: widget.index,
            initialFeatures: widget.room?.features ?? [],
          ),
          20.verticalSpace,
          const SelectedRoomImagesView(),
          if (canSave)
            Consumer(
              builder: (context, ref, _) {
                final notifier = ref.watch(
                  workspaceRoomNotifierProvider.notifier,
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _SaveButton(
                      icon: const Icon(Icons.delete, color: AppColors.danger),
                      isDeleteButton: true,
                      onTap: () => notifier.removeRoom(widget.index),
                    ),
                    5.horizontalSpace,
                    _SaveButton(
                      icon: isLoading
                          ? const CupertinoActivityIndicator()
                          : isSaved
                              ? Icon(
                                  Icons.check,
                                  color: context.theme.primaryColor,
                                )
                              : Icon(
                                  Icons.save,
                                  color: context.theme.primaryColor,
                                ),
                      onTap: () => _submit(ref),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Future<List<String>> _uploadImages(WidgetRef ref) async {
    final images = ref.watch(roomImageSelectorNotifierProvider);
    if (images.isEmpty) {
      return [];
    }
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final imageUrls = await notifier.uploadImages(images);

    return imageUrls;
  }

  void _submit(WidgetRef ref) async {
    final notifier = ref.watch(workspaceRoomNotifierProvider.notifier);
    isLoading = true;

    final images = await _uploadImages(ref);

    final room = WorkspaceRoomModel(
      id: widget.room?.id,
      name: nameController.text,
      description: shortDescriptionController.text,
      maxCapacity: int.parse(maxCapacityController.text),
      amount: double.parse(amountController.text),
      features: widget.room?.features ?? [], // Use room-specific features
      images: images,
    );
    notifier.updateRoom(widget.index, room);

    isLoading = false;
    isSaved = true;
    setState(() {});
  }
}

class RoomAmenitiesSection extends ConsumerStatefulWidget {
  final int roomIndex;
  final List<String> initialFeatures;
  
  const RoomAmenitiesSection({
    super.key,
    required this.roomIndex,
    required this.initialFeatures,
  });

  @override
  ConsumerState<RoomAmenitiesSection> createState() => _RoomAmenitiesSectionState();
}

class _RoomAmenitiesSectionState extends ConsumerState<RoomAmenitiesSection> {
  late List<String> selectedFeatures;
  
  @override
  void initState() {
    super.initState();
    selectedFeatures = List.from(widget.initialFeatures);
  }

  @override
  Widget build(BuildContext context) {
    final amenities = ref.watch(amenitiesNotifierProvider);
    final amenityLabels = amenities.map((a) => a.label).toList();
    
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
            (amenityLabels.length / 2).ceil(),
            (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: _RoomAmenityCheckbox(
                        onChanged: () => _toggleAmenity(
                          amenityLabels[rowIndex * 2],
                        ),
                        label: amenityLabels[rowIndex * 2],
                        isSelected: selectedFeatures.contains(amenityLabels[rowIndex * 2]),
                      ),
                    ),
                  ),
                  if (rowIndex * 2 + 1 < amenityLabels.length)
                    Expanded(
                      child: SizedBox(
                        child: _RoomAmenityCheckbox(
                          onChanged: () => _toggleAmenity(
                            amenityLabels[rowIndex * 2 + 1],
                          ),
                          label: amenityLabels[rowIndex * 2 + 1],
                          isSelected: selectedFeatures.contains(amenityLabels[rowIndex * 2 + 1]),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void _toggleAmenity(String amenity) {
    setState(() {
      if (selectedFeatures.contains(amenity)) {
        selectedFeatures.remove(amenity);
      } else {
        selectedFeatures.add(amenity);
      }
    });
    
    // Update the room with the new features
    _updateRoomFeatures();
  }

  void _updateRoomFeatures() {
    final notifier = ref.read(workspaceRoomNotifierProvider.notifier);
    final rooms = ref.read(workspaceRoomNotifierProvider).toList();
    if (widget.roomIndex < rooms.length) {
      final currentRoom = rooms[widget.roomIndex];
      final updatedRoom = WorkspaceRoomModel(
        id: currentRoom.id,
        name: currentRoom.name,
        description: currentRoom.description,
        maxCapacity: currentRoom.maxCapacity,
        amount: currentRoom.amount,
        features: selectedFeatures,
        images: currentRoom.images,
      );
      notifier.updateRoom(widget.roomIndex, updatedRoom);
    }
  }
}

class _RoomAmenityCheckbox extends StatefulWidget {
  final VoidCallback onChanged;
  final String label;
  final bool isSelected;
  const _RoomAmenityCheckbox({
    required this.label,
    required this.onChanged,
    this.isSelected = false,
  });

  @override
  State<_RoomAmenityCheckbox> createState() => __RoomAmenityCheckboxState();
}

class __RoomAmenityCheckboxState extends State<_RoomAmenityCheckbox> {
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
