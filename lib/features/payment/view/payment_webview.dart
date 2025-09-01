import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewArgs {
  final String bookingId;
  final String paystackUrl;
  PaymentWebviewArgs({required this.bookingId, required this.paystackUrl});
}

class PaymentWebview extends StatefulWidget {
  final PaymentWebviewArgs args;
  const PaymentWebview({super.key, required this.args});

  @override
  State<PaymentWebview> createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
  late WebViewController _webViewController;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    const Factory(EagerGestureRecognizer.new),
  };

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      // ..setOnJavaScriptConfirmDialog(
      //     (JavaScriptConfirmDialogRequest dialogRequest) async {
      //   debugLog("dialogRequest => ${dialogRequest.message}");
      //   return false;
      // })
      // ..setOnConsoleMessage((JavaScriptConsoleMessage message) {
      //   debugLog("message => ${message.message}");
      // })
      // ..setOnJavaScriptAlertDialog((JavaScriptAlertDialogRequest dialogRequest) async {
      //   debugLog("alertDialogRequest => ${dialogRequest.message}");
      // })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() => _isLoading = progress < 100);
            }
            debugLog('Loading progress: $progress%');
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() => _isLoading = true);
            }
            debugLog('onPageStarted url => $url');
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
            debugLog('onPageFinished url => $url');
          },
          onHttpError: (HttpResponseError error) {
            debugLog('HTTP Error occurred');
            if (mounted) {
              setState(() => _isLoading = false);
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugLog('Web Resource Error: ${error.errorType}');
            if (mounted) {
              setState(() => _isLoading = false);
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            debugLog("onNavigationRequest: ${request.url}");
            if (request.url.contains('https://tivitea.africa/')) {
              if (mounted) {
                const bookingHistoryDetail =
                    '${AppRoutes.homeView}${AppRoutes.bookingHistoryDetails}';
                context.go(bookingHistoryDetail, extra: widget.args.bookingId);
              }
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (urlChange) => debugLog("onUrlChange: ${urlChange.url}"),
        ),
      )
      ..loadRequest(Uri.parse(widget.args.paystackUrl));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: _webViewController,
            gestureRecognizers: gestureRecognizers,
          ),
          _isLoading ? const _WebviewLoader() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _WebviewLoader extends StatelessWidget {
  const _WebviewLoader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
