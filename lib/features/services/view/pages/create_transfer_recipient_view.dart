import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/services/model/create_transfer_recipient_model.dart';
import 'package:tivi_tea/features/services/model/get_account_details_request_body.dart';
import 'package:tivi_tea/features/services/view/widgets/bank_list_dropdown.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/bank_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateTransferRecipientView extends ConsumerStatefulWidget {
  final String footSoldierEmail;
  const CreateTransferRecipientView({
    super.key,
    required this.footSoldierEmail,
  });

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
  bool hasCreatedTransferRecipient = false;

  String bankCode = '';

  @override
  void initState() {
    super.initState();
    _accountNumberListener();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(bankOperationNotifierProvider.notifier).getBanks();
    });
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
    final accountFetchLoadState = ref.watch(
      bankOperationNotifierProvider.select(
        (value) => value.getAccountLoadState,
      ),
    );
    final banks = ref.watch(bankOperationNotifierProvider).banks;
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Form(
          key: _formKey,
          onChanged: () {
            setState(() {
              isEnabled = _formKey.currentState!.validate();
            });
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text(
                  'Foot Soldier Bank Details',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 16.sp,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Foot Soldiers are essential to ensuring timely and efficient delivery, monitoring and pick-up of tools for our users!',
                  style: context.theme.textTheme.displaySmall?.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                30.verticalSpace,
                BankListDropdown(
                  banks: banks,
                  onItemSelected: (bank) {
                    bankNameController.text = bank.name ?? '';
                    bankCode = bank.code ?? '';
                  },
                ),
                20.verticalSpace,
                AppTextField(
                  controller: accountNumberController,
                  label: 'Account Number',
                  hintText: 'Enter Account Number',
                  maxLength: 10,
                  validateFunction: Validators.accountNumber(),
                ),
                AppTextField(
                  controller: accountNameController,
                  label: 'Account Name',
                  hintText: 'Enter Account Name',
                  validateFunction: Validators.name(),
                  readOnly: true,
                  enabled: false,
                  suffixIcon: accountFetchLoadState == LoadState.loading
                      ? const CupertinoActivityIndicator()
                      : null,
                ),
                70.verticalSpace,
                Consumer(
                  builder: (context, ref, _) {
                    final postWorkToolLoadState = ref.watch(
                      partnerServicesNotiferProvider.select(
                        (value) => value.postWorkToolLoadState,
                      ),
                    );
                    final cloudinaryLoadState = ref.watch(
                      partnerServicesNotiferProvider.select(
                        (value) => value.cloudinaryUploadState,
                      ),
                    );
                    final bankLoadState = ref.watch(
                      bankOperationNotifierProvider.select(
                        (value) => value.createTransferRecipientLoadState,
                      ),
                    );

                    final isLoading =
                        cloudinaryLoadState == LoadState.loading ||
                            postWorkToolLoadState == LoadState.loading ||
                            bankLoadState == LoadState.loading;
                    return Center(
                      child: AppButton(
                        isLoading: isLoading,
                        buttonText: hasCreatedTransferRecipient
                            ? "Upload Work Tool Listing"
                            : "Create Transfer Recipient",
                        onPressed: () => hasCreatedTransferRecipient
                            ? _postWorkToolListing()
                            : _submitAccountDetails(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getAccountDetails() {
    final notifier = ref.read(bankOperationNotifierProvider.notifier);
    final data = GetAccountDetailsRequestBody(
      accountNumber: accountNumberController.text,
      bankCode: bankCode,
    );
    notifier.getAccountDetails(
      data: data,
      onSuccess: (data) => accountNameController.text = data.accountName ?? '',
    );
  }

  void _submitAccountDetails() {
    final notifier = ref.read(bankOperationNotifierProvider.notifier);
    final data = CreateTransferRecipientModel(
      accountNumber: accountNumberController.text,
      name: accountNameController.text,
      bankCode: bankCode,
      footSoldierEmail: widget.footSoldierEmail,
    );
    notifier.createTransferRecipient(
      data: data,
      onSuccess: (data) {
        hasCreatedTransferRecipient = true;
        setState(() {});
        context.showSuccess('Transfer recipient created successfully');
      },
      onError: (error) => context.showError(error),
    );
  }

  void _postWorkToolListing() {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final savedListing = ref.watch(
      partnerServicesNotiferProvider.select(
        (value) => value.savedWorkToolListing,
      ),
    );
    if (savedListing != null) {
      notifier.postToolOrOtherListing(
        savedListing,
        onSuccess: () {
          ref.read(partnerServicesNotiferProvider.notifier).getPartnerListing();
          _showSuccessDialog();
        },
        onError: (error) => context.showError(error),
      );
    }
  }

  void _showSuccessDialog() {
    context.showCustomDialog(
      dismissible: false,
      child: AppSuccessContent(
        title: 'Success',
        subtitle:
            "Your post has been created and will be saved as 'Draft' until the admin approves it.",
        buttonText: context.l10n.continue_,
        onPressed: () {
          context.pop();
          context.go(AppRoutes.myListingView);
        },
      ),
    );
  }
}
