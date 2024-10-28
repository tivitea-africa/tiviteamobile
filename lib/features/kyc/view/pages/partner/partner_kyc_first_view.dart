import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/widgets/choose_file_container.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view/widgets/custom_dropdown.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PartnerKYCFirstView extends StatefulWidget {
  const PartnerKYCFirstView({super.key});

  @override
  State<PartnerKYCFirstView> createState() => _PartnerKYCFirstViewState();
}

class _PartnerKYCFirstViewState extends State<PartnerKYCFirstView> {
  TextEditingController registrationNumberController = TextEditingController();
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
          CustomDropdown(
            onOptionSelected: (value) {
              documentType = value;
              setState(() {});
            },
            items: KYCDocumentTypeExt.stringValues,
          ),
          AppTextField(
            controller: registrationNumberController,
            label: context.l10n.registrationNumber,
            hintText: context.l10n.enterRegistrationNumber,
          ),
          const ChooseFileContainer(),
        ],
      ),
    );
  }
}
