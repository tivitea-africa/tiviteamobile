import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/services/model/get_account_details_request_body.dart';
import 'package:tivi_tea/features/services/view/widgets/bank_list_dropdown.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/bank_notifier.dart';

class CreateTransferRecipientView extends ConsumerStatefulWidget {
  const CreateTransferRecipientView({super.key});

  @override
  ConsumerState<CreateTransferRecipientView> createState() =>
      _CreateTransferRecipientViewState();
}

class _CreateTransferRecipientViewState
    extends ConsumerState<CreateTransferRecipientView> {
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  String bankCode = '';

  @override
  void initState() {
    super.initState();
    _accountNumberListener();
  }

  @override
  void dispose() {
    bankNameController.dispose();
    accountNameController.dispose();
    accountNumberController.dispose();
    super.dispose();
  }

  void _accountNumberListener() {
    accountNumberController.addListener(() {
      if (accountNumberController.text.length == 10) {
        _getAccountDetails();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: true),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState!.validate();
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foot Soldier Bank Details',
              style: context.theme.textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
            10.verticalSpace,
            Text(
              'Foot Soldiers are essential to ensuring timely and efficient delivery, monitoring and pick-up of tools for our users!',
              style: context.theme.textTheme.displaySmall,
            ),
            50.verticalSpace,
            BankListDropdown(
              banks: ref.watch(bankOperationNotifierProvider).banks,
              onItemSelected: (bank) {
                bankNameController.text = bank.name ?? '';
              },
            ),
            AppTextField(
              controller: accountNameController,
              label: 'Account Name',
              hintText: 'Enter Account Name',
              validateFunction: Validators.name(),
            ),
            AppTextField(
              controller: accountNumberController,
              label: 'Account Number',
              hintText: 'Enter Account Number',
              maxLength: 10,
              validateFunction: Validators.accountNumber(),
            ),
          ],
        ),
      ),
    );
  }

  void _getAccountDetails() {
    final notifier = ref.read(bankOperationNotifierProvider.notifier);
    final data = GetAccountDetailsRequestBody(
      accountNumber: accountNumberController.text,
      bankCode: bankNameController.text,
    );
    notifier.getAccountDetails(
      data: data,
      onSuccess: (data) => accountNameController.text = data.accountName ?? '',
    );
  }
}
