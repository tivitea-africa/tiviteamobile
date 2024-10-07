import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';
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
          context.l10n.roomDetails,
          style: context.theme.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        10.verticalSpace,
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
                  itemBuilder: (ctx, i) => _RoomContainer(index: i),
                );
              },
            ),
          ],
        ),
        20.verticalSpace,
        Consumer(builder: (context, ref, _) {
          final notifier = ref.read(workspaceRoomNotifierProvider.notifier);
          return IntrinsicWidth(
            child: CreateListingButton(
              text: context.l10n.addMore,
              iconColor: Colors.black,
              textColor: Colors.black,
              backgroundColor: const Color(0xFFE8E8EB),
              onTap: () => notifier.addRoom(),
            ),
          );
        }),
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
  final int index;
  const _RoomContainer({required this.index});

  @override
  State<_RoomContainer> createState() => __RoomContainerState();
}

class __RoomContainerState extends State<_RoomContainer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();
  final TextEditingController maxCapacityController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  bool isLoading = false;
  bool isSaved = false;
  bool canSave = false;

  @override
  void initState() {
    super.initState();

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
            hintText: context.l10n.nameOfRoom,
          ),
          AppTextField(
            controller: shortDescriptionController,
            hintText: context.l10n.shortDescription,
          ),
          AppTextField(
            controller: maxCapacityController,
            hintText: context.l10n.availableSeats,
            keyboardType: TextInputType.number,
          ),
          AppTextField(
            controller: amountController,
            hintText: context.l10n.pricingType,
            keyboardType: TextInputType.number,
          ),
          if (canSave)
            Consumer(builder: (context, ref, _) {
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
                    onTap: () {
                      isLoading = true;

                      final room = WorkspaceRoomModel(
                        name: nameController.text,
                        description: shortDescriptionController.text,
                        maxCapacity: int.parse(maxCapacityController.text),
                        amount: double.parse(amountController.text),
                        images: [],
                      );
                      notifier.updateRoom(widget.index, room);

                      isLoading = false;
                      isSaved = true;
                      setState(() {});
                    },
                  ),
                ],
              );
            }),
        ],
      ),
    );
  }
}
