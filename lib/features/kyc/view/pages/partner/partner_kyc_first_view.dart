import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/view/widgets/choose_file_container.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PartnerKYCFirstView extends StatefulWidget {
  const PartnerKYCFirstView({super.key});

  @override
  State<PartnerKYCFirstView> createState() => _PartnerKYCFirstViewState();
}

class _PartnerKYCFirstViewState extends State<PartnerKYCFirstView> {
  TextEditingController registrationNumberController = TextEditingController();
  XFile? selectedImage;

  String documentType = '';
  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.businessVerification,
        headerSectionSubtitle: context.l10n.tiviteaRequires,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              controller: registrationNumberController,
              label: context.l10n.registrationNumber,
              hintText: context.l10n.enterRegistrationNumber,
            ),
            20.verticalSpace,
            ChooseFileContainer(
              onImageSelected: (file) {
                selectedImage = file;
                setState(() {});
              },
            ),
            20.verticalSpace,
            if (selectedImage == null)
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
                    Text(selectedImage?.path.split('-').last ?? ''),
                    10.horizontalSpace,
                    InkWell(
                      onTap: () {
                        selectedImage = null;
                        setState(() {});
                      },
                      child: const Icon(Icons.close, color: Colors.red),
                    )
                  ],
                ),
              ),
            20.verticalSpace,
            AppButton(onPressed: _navigateToNextView),
          ],
        ),
      ),
    );
  }

  void _navigateToNextView() {
    final data = KYCSecondViewParams(
      documentType: documentType,
      registrationNumber: registrationNumberController.text,
      image: selectedImage,
    );
    context.go(
      '${AppRoutes.servicesView}/${AppRoutes.partnerKYCSecondView}',
      extra: data,
    );
  }
}
