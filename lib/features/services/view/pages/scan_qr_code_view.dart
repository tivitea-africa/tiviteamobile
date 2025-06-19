import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/services/view_model/booking_notifier.dart';

class ScanQRCodeView extends ConsumerStatefulWidget {
  const ScanQRCodeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends ConsumerState<ScanQRCodeView> {
  late MobileScannerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(detectionTimeoutMs: 1000);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Expanded(
                child: MobileScanner(
                  controller: _controller,
                  onDetect: (barcodes) {
                    debugLog(
                      barcodes.barcodes.map((e) => e.rawValue).join(', '),
                    );
                    _checkInCheckOut(barcodes.barcodes.first.rawValue ?? '');
                  },
                ),
              ),
              Container(
                width: context.width,
                height: context.height,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _checkInCheckOut(String bookingId) {
    final notifier = ref.read(bookingNotiferProvider.notifier);
    notifier.checkInCheckOut(bookingId, onSuccess: (message) {
      context.showSuccess(message);
    }, onError: (message) {
      context.showError(message);
    });
    _leaveScreen();
  }

  void _leaveScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.pop();
      }
    });
  }
}
