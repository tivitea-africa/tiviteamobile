import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/widgets/bottom_sheet_widget.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/features/profile/view/widgets/profile_appbar_header.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);
    final profilePicLoadState = ref.watch(profileNotiferProvider.select(
      (value) => value.editProfileLoadState,
    ));
    final imageUploadState = ref.watch(partnerServicesNotiferProvider.select(
      (value) => value.cloudinaryUploadState,
    ));
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ProfileAppbarHeader(),
        AnimatedPositioned(
          left: 0,
          right: 0,
          bottom: -80,
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              profilePicLoadState == LoadState.loading ||
                      imageUploadState == LoadState.loading
                  ? const CupertinoActivityIndicator()
                  : GestureDetector(
                      onTap: () => _showBottomSheet(context, ref),
                      child: Stack(
                        children: [
                          user.profilePicture == null
                              ? const CircleAvatar(radius: 50)
                              : Container(
                                  width: 90.w,
                                  height: 90.h,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context
                                        .theme.colorScheme.onPrimaryContainer,
                                  ),
                                  child: AppImageWidget(
                                    borderRadius: BorderRadius.circular(50),
                                    imagePath: user.profilePicture ?? '',
                                  ),
                                ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  context.theme.primaryColor.withOpacity(
                                0.5,
                              ),
                              child: AppSvgWidget(
                                path: Assets.svgs.camera,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              10.verticalSpace,
              Text(
                '${user.firstName} ${user.lastName}',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: context.theme.primaryColor,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, WidgetRef ref) {
    context.showBottomSheet(
      title: context.l10n.uploadDocument,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetWidget(
              chooseFileType: ChooseFileType.takePhoto,
              onImageSelected: (file) => _updateProfilePic(file, ref, context),
            ),
            20.horizontalSpace,
            BottomSheetWidget(
              chooseFileType: ChooseFileType.selectFromGallery,
              onImageSelected: (file) => _updateProfilePic(file, ref, context),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfilePic(
    XFile file,
    WidgetRef ref,
    BuildContext context,
  ) async {
    final notifier = ref.read(profileNotiferProvider.notifier);
    final user = ref.read(userRepositoryProvider).getUser();
    final image = await _uploadImages(file, ref);
    final data = EditProfileModel(
      phoneNumber: user.phoneNumber,
      profilePicture: image.first,
    );
    notifier.updateProfile(
      data,
      onSuccess: () {
        context.showSuccess('Profile Picture successfully uploaded');
        ref.read(userNotifierProvider.notifier).refreshUser();
      },
      onError: (message) => context.showError(message),
    );
  }

  Future<List<String>> _uploadImages(XFile file, WidgetRef ref) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final imageUrls = await notifier.uploadImages([file]);

    return imageUrls;
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
