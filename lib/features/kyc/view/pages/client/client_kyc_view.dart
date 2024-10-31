import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/widgets/bottom_sheet_widget.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ClientKYCView extends StatefulWidget {
  const ClientKYCView({super.key});

  @override
  State<ClientKYCView> createState() => _ClientKYCViewState();
}

class _ClientKYCViewState extends State<ClientKYCView> {
  TextEditingController ninNumberController = TextEditingController();
  XFile? selectedFrontImage;
  XFile? selectedBackImage;

  String documentType = '';
  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.proofOfIdentity,
        headerSectionSubtitle: context.l10n.provideInfo,
      ),
      body: Column(
        children: [
          CustomDropdown(
            label: context.l10n.documentType,
            onOptionSelected: (value) {
              documentType = value;
              setState(() {});
            },
            items: KYCDocumentTypeExt.stringValues,
          ),
          20.verticalSpace,
          AppTextField(
            controller: ninNumberController,
            label: context.l10n.ninNumber,
            hintText: context.l10n.enterNinNumber,
          ),
          20.verticalSpace,
          Text(
            context.l10n.uploadFront,
            style: context.theme.textTheme.labelMedium,
          ),
          Text(
            context.l10n.uploadFrontDesc,
            style: context.theme.textTheme.labelMedium,
          ),
          _ChooseFileContainer(
            onImageSelected: (file) {},
          ),
          Text(
            context.l10n.uploadBack,
            style: context.theme.textTheme.labelMedium,
          ),
          Text(
            context.l10n.uploadBackDesc,
            style: context.theme.textTheme.labelMedium,
          ),
          _ChooseFileContainer(
            onImageSelected: (file) {},
          ),
        ],
      ),
    );
  }
}

class _ChooseFileContainer extends StatelessWidget {
  final Function(XFile) onImageSelected;
  const _ChooseFileContainer({required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8EB).withOpacity(0.3),
          border: Border.all(
            color: const Color(0xFFD8D8DD).withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    'No File Added',
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  AppSvgWidget(path: Assets.svgs.cloudUpload),
                  Text(
                    context.l10n.chooseAFile,
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    context.showBottomSheet(
      title: context.l10n.uploadDocument,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetWidget(
              chooseFileType: ChooseFileType.takePhoto,
              onImageSelected: onImageSelected,
            ),
            20.horizontalSpace,
            BottomSheetWidget(
              chooseFileType: ChooseFileType.selectFromGallery,
              onImageSelected: onImageSelected,
            ),
          ],
        ),
      ),
    );
  }
}
