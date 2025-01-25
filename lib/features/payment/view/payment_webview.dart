import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebview extends StatefulWidget {
  final String paystackUrl;
  const PaymentWebview({super.key, required this.paystackUrl});

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
      ..setOnJavaScriptConfirmDialog(
          (JavaScriptConfirmDialogRequest dialogRequest) async {
        debugLog("dialogRequest => ${dialogRequest.message}");
        return false;
      })
      ..setOnConsoleMessage((JavaScriptConsoleMessage message) {
        debugLog("message => ${message.message}");
      })
      ..setOnJavaScriptAlertDialog((JavaScriptAlertDialogRequest dialogRequest) async {
        debugLog("alertDialogRequest => ${dialogRequest.message}");
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            debugLog('onPageStarted url => $url');
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            debugLog('onPageFinished url => $url');
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            debugLog("onNavigationRequest: ${request.url}");
            // if (request.url.startsWith('https://www.payoff.ng')) {
            //   ref.read(cardNotifier.notifier).getUserCards();
            //   context.pop();
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
          onUrlChange: (urlChange) {
            debugLog("onUrlChange: ${urlChange.url}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paystackUrl));
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
        color: Colors.black.withOpacity(0.5),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
