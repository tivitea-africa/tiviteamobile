import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_checkbox.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/view/widgets/choose_file_container.dart';
import 'package:tivi_tea/features/kyc/view_model/partner/partner_kyc_notifier.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PartnerKYCSecondView extends StatefulWidget {
  final KYCSecondViewParams params;
  const PartnerKYCSecondView({super.key, required this.params});

  @override
  State<PartnerKYCSecondView> createState() => _PartnerKYCSecondViewState();
}

class _PartnerKYCSecondViewState extends State<PartnerKYCSecondView> {
  TextEditingController utilityBillNumberController = TextEditingController();
  XFile? selectedUtilityBillImage;
  String documentType = '';
  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.businessVerification,
        headerSectionSubtitle: context.l10n.tiviteaRequires,
      ),
      body: Column(
        children: [
          AppTextField(
            controller: utilityBillNumberController,
            label: context.l10n.proofOfBusinessAddress,
            hintText: context.l10n.utilityBillDocument,
          ),
          ChooseFileContainer(
            onImageSelected: (file) {
              selectedUtilityBillImage = file;
              setState(() {});
            },
          ),
          20.verticalSpace,
          if (selectedUtilityBillImage == null)
            const SizedBox.shrink()
          else
            Container(
              width: context.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(color: const Color(0xFFEBEBEB)),
              ),
              child: Row(
                children: [
                  AppSvgWidget(path: Assets.svgs.doc),
                  10.horizontalSpace,
                  Text(selectedUtilityBillImage?.path.split('-').last ?? ''),
                  10.horizontalSpace,
                  InkWell(
                    onTap: () {
                      selectedUtilityBillImage = null;
                      setState(() {});
                    },
                    child: const Icon(Icons.close, color: Colors.red),
                  )
                ],
              ),
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
              final loadState =
                  ref.watch(partnerKycNotifierProvider).kycLoadState;
              final imageUploadState = ref
                  .watch(partnerServicesNotiferProvider)
                  .cloudinaryUploadState;
              return AppButton(
                isLoading: loadState == LoadState.loading ||
                    imageUploadState == LoadState.loading,
                onPressed: () => _submit(ref),
              );
            },
          ),
        ],
      ),
    );
  }

  void _submit(WidgetRef ref) async {
    final notifier = ref.read(partnerKycNotifierProvider.notifier);
    final businessDocImageUrl = await _uploadImages(ref, widget.params.image);
    final image = await _uploadImages(ref, selectedUtilityBillImage);

    debugLog("IMage::: $businessDocImageUrl");

    final data = PartnerKycRequestBody(
      documentType: widget.params.documentType,
      registrationNumber: widget.params.registrationNumber,
      businessDocumentImage: businessDocImageUrl.first,
      utilityBill: utilityBillNumberController.text,
      utilityBillImage: image.first,
    );

    notifier.submitKYC(
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
