import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/services/token_expiration_service.dart';
import 'package:tivi_tea/features/home/view/client/customer_home_screen.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_home_view.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class GeneralHomeScreeen extends ConsumerStatefulWidget {
  const GeneralHomeScreeen({super.key});

  @override
  ConsumerState<GeneralHomeScreeen> createState() => _GeneralHomeScreeenState();
}

class _GeneralHomeScreeenState extends ConsumerState<GeneralHomeScreeen> {
  StreamSubscription<bool>? _tokenExpirationSubscription;

  @override
  void initState() {
    super.initState();
    _setupTokenExpirationListener();
  }

  @override
  void dispose() {
    _tokenExpirationSubscription?.cancel();
    super.dispose();
  }

  void _setupTokenExpirationListener() {
    final tokenExpirationService = ref.read(tokenExpirationServiceProvider);
    _tokenExpirationSubscription = tokenExpirationService.tokenExpiredStream.listen(
      (isExpired) {
        if (isExpired && mounted) {
          _handleTokenExpiration();
        }
      },
    );
  }

  void _handleTokenExpiration() {
    if (!mounted) return;
    
    // Show error snackbar
    context.showError('Your session has expired. Please log in again.');
    
    // Navigate to login after a short delay to let user see the message
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _navigateToLogin();
      }
    });
  }

  void _navigateToLogin() {
    if (!mounted) return;
    
    // Clear user session and navigate to login
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    loginNotifier.logout(
      onDataCleared: () {
        // Navigate to login screen after data is cleared
        if (mounted) {
          context.go(AppRoutes.loginView);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    final entityType = user.entityType ?? EntityType.client;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return;
      },
      child: switch (entityType) {
        EntityType.partner => const ServiceProviderHomeScreen(),
        EntityType.client => const CustomerHomeScreen(),
      },
    );
  }
}
