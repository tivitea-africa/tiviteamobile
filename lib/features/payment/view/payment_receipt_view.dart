import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/payment/view_model/client/client_payment_notifier.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PaymentReceiptView extends ConsumerStatefulWidget {
  final String paymentId;
  const PaymentReceiptView({super.key, required this.paymentId});

  @override
  ConsumerState<PaymentReceiptView> createState() => _PaymentReceiptViewState();
}

class _PaymentReceiptViewState extends ConsumerState<PaymentReceiptView> {
  File? _receipt;
  bool _recieptLoading = true;
  bool _isGeneratingImageForSharing = false;
  bool _isError = false;
  final ScreenshotController _screenController = ScreenshotController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => generateReceipt());
  }

  void generateReceipt() {
    final notifier = ref.read(clientPaymentNotifierProvider.notifier);
    notifier.generatePaymentReceipt(widget.paymentId, onSuccess: (data) {
      setState(() {
        _receipt = data;
        _isError = false;
        _recieptLoading = false;
      });
    }, onError: (message) {
      setState(() {
        _isError = true;
        _recieptLoading = false;
      });
      context.showError('An error occurred while generating receipt');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.eReceipt,
        headerSectionSubtitle: context.l10n.downloadEReceiptHere,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_recieptLoading)
              const Center(
                child: CupertinoActivityIndicator(),
              )
            else
              (_receipt == null)
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Screenshot(
                        controller: _screenController,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          child: PDFView(
                            filePath: _receipt?.path ?? '',
                            enableSwipe: true,
                            swipeHorizontal: true,
                            autoSpacing: false,
                            pageFling: false,
                            backgroundColor: Colors.grey,
                            fitPolicy: FitPolicy.BOTH,
                            onRender: (pages) {
                              debugLog('Total Pages: $pages');
                            },
                            onError: (error) {
                              debugLog('PDF Error: ${error.toString()}');
                            },
                            onPageError: (page, error) {
                              debugLog(
                                  'PDF Page Error: $page: ${error.toString()}');
                            },
                            onViewCreated:
                                (PDFViewController pdfViewController) {
                              debugLog('PDF View Created');
                            },
                          ),
                        ),
                      ),
                    ),
            if (_isError)
              AppButton(
                  buttonText: 'Retry',
                  borderColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  textColor: context.theme.primaryColor,
                  onPressed: () => generateReceipt()),
            AppButton(
              buttonText: context.l10n.goHome,
              onPressed: () => context.go(AppRoutes.homeView),
            ),
            AppButton(
              buttonText: context.l10n.share,
              borderColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              textColor: context.theme.primaryColor,
              onPressed: () => _showBottomSheet(),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _showBottomSheet() {
    context.showBottomSheet(
      title: context.l10n.share,
      child: Column(
        children: [
          AppButton(
            buttonText: context.l10n.pdf,
            onPressed: () => _shareReceipt(_receipt?.path ?? ''),
          ),
          20.verticalSpace,
          AppButton(
            buttonText: context.l10n.image,
            isLoading: _isGeneratingImageForSharing,
            onPressed: () => _getReceiptImage().then(
              (value) => _shareReceipt(value!),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _getReceiptImage() async {
    try {
      setState(() {
        _isGeneratingImageForSharing = true;
      });

      return _screenController.capture().then((image) async {
        if (image == null) {
          return null;
        }
        final directory = await getTemporaryDirectory();
        final imageFile = await File(
          '${directory.path}/${widget.paymentId.split('-').last}.png',
        ).create();
        await imageFile.writeAsBytes(image);
        return imageFile.path;
      });
    } catch (_) {
      return null;
    } finally {
      setState(() {
        _isGeneratingImageForSharing = false;
      });
    }
  }

  void _shareReceipt(String filePath) async {
    final l = await Share.shareXFiles([
      XFile(
        filePath,
        name: widget.paymentId,
      )
    ]);
    if (l.status == ShareResultStatus.success && mounted) {
      Navigator.pop(context);
    }
  }
}
