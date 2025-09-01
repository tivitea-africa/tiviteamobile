import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_checkbox.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/kyc/model/client_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/pages/submit_document_view.dart';
import 'package:tivi_tea/features/kyc/view/widgets/bottom_sheet_widget.dart';
import 'package:tivi_tea/features/kyc/view_model/client/client_kyc_notifier.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ClientKYCView extends ConsumerStatefulWidget {
  const ClientKYCView({super.key});

  @override
  ConsumerState<ClientKYCView> createState() => _ClientKYCViewState();
}

class _ClientKYCViewState extends ConsumerState<ClientKYCView> {
  TextEditingController documentIdController = TextEditingController();
  XFile? selectedFrontImage;
  XFile? selectedBackImage;

  String documentType = '';
  bool docIdIsPopulated = false;
  bool showSubmitDocument = false;

  @override
  void initState() {
    super.initState();
    documentIdController.addListener(() {
      docIdIsPopulated = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.proofOfIdentity,
        headerSectionSubtitle: context.l10n.provideInfo,
      ),
      body: showSubmitDocument
          ? SubmitDocumentView(
              submitDocs: () => _submitKYC(ref),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdown(
                    label: context.l10n.documentType,
                    onOptionSelected: (value) {
                      documentType = value;
                      setState(() {});
                    },
                    items: ClientKYCDocumentTypeExt.stringValues,
                  ),
                  20.verticalSpace,
                  AppTextField(
                    controller: documentIdController,
                    label: context.l10n.ninNumber,
                    hintText: context.l10n.enterNinNumber,
                  ),
                  Text(
                    context.l10n.uploadFront,
                    style: context.theme.textTheme.labelMedium,
                  ),
                  Text(
                    context.l10n.uploadFrontDesc,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontSize: 12.h,
                      color: const Color(0xFF5C5C66),
                    ),
                  ),
                  20.verticalSpace,
                  _ChooseFileContainer(
                    onImageSelected: (file) {
                      selectedFrontImage = file;
                      setState(() {});
                    },
                    selectedImage: selectedFrontImage,
                    removeSelectedImage: () {
                      selectedFrontImage = null;
                      setState(() {});
                    },
                  ),
                  20.verticalSpace,
                  Text(
                    context.l10n.uploadBack,
                    style: context.theme.textTheme.labelMedium,
                  ),
                  Text(
                    context.l10n.uploadBackDesc,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontSize: 12.h,
                      color: const Color(0xFF5C5C66),
                    ),
                  ),
                  20.verticalSpace,
                  _ChooseFileContainer(
                    onImageSelected: (file) {
                      selectedBackImage = file;
                      setState(() {});
                    },
                    selectedImage: selectedBackImage,
                    removeSelectedImage: () {
                      selectedBackImage = null;
                      setState(() {});
                    },
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      AppCheckbox(onChanged: (value) {}),
                      10.horizontalSpace,
                      Flexible(child: Text(context.l10n.confirmAllInfoProvided))
                    ],
                  ),
                  50.verticalSpace,
                  Consumer(
                    builder: (context, ref, _) {
                      final isEnabled = documentType.isNotEmpty &&
                          docIdIsPopulated &&
                          (selectedFrontImage != null) &&
                          (selectedBackImage != null);
                      return AppButton(
                        isEnabled: isEnabled,
                        onPressed: _showSubmitDocument,
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }

  void _showSubmitDocument() {
    showSubmitDocument = true;
    setState(() {});
  }

  void _submitKYC(WidgetRef ref) async {
    final notifier = ref.read(clientKycNotifierProvider.notifier);

    final frontImage = await _uploadImages(ref, selectedFrontImage);
    final backImage = await _uploadImages(ref, selectedBackImage);
    final data = ClientKYCRequestBody(
      documentType: documentType,
      documentId: documentIdController.text,
      frontImage: frontImage.first,
      backImage: backImage.first,
    );

    notifier.submitClientKYC(
      data,
      onSuccess: () {
        ref.read(profileNotiferProvider.notifier).getUserProfile();
        context.go(AppRoutes.servicesView);
      },
      onError: (error) => context.showError(error),
    );
  }

  Future<List<String>> _uploadImages(WidgetRef ref, XFile? file) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    if (file == null) return [];
    final imageUrls = await notifier.uploadImages([file]);

    return imageUrls;
  }
}

class _ChooseFileContainer extends StatelessWidget {
  final Function(XFile) onImageSelected;
  final VoidCallback removeSelectedImage;
  final XFile? selectedImage;
  const _ChooseFileContainer({
    required this.onImageSelected,
    this.selectedImage,
    required this.removeSelectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: Container(
        width: context.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD8D8DD)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedImage == null)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E8EB).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 35,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'No File Added',
                        style: context.theme.textTheme.displaySmall?.copyWith(
                          color: const Color(0xFF5C5C66),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Row(
                children: [
                  AppSvgWidget(path: Assets.svgs.doc),
                  10.horizontalSpace,
                  Text(selectedImage?.path.split('-').last ?? ''),
                  10.horizontalSpace,
                  InkWell(
                    onTap: removeSelectedImage,
                    child: const Icon(Icons.close, color: Colors.red),
                  )
                ],
              ),
            10.horizontalSpace,
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8EB).withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              child: Row(
                children: [
                  AppSvgWidget(path: Assets.svgs.cloudUpload),
                  5.horizontalSpace,
                  Text(
                    context.l10n.chooseAFile,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      color: const Color(0xFF5C5C66),
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
