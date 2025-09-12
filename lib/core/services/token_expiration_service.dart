import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service to handle token expiration events
class TokenExpirationService {
  static final TokenExpirationService _instance = TokenExpirationService._internal();
  factory TokenExpirationService() => _instance;
  TokenExpirationService._internal();

  final StreamController<bool> _tokenExpiredController = StreamController<bool>.broadcast();
  
  /// Stream that emits true when token is expired and refresh fails
  Stream<bool> get tokenExpiredStream => _tokenExpiredController.stream;
  
  /// Emit token expiration event
  void emitTokenExpired() {
    _tokenExpiredController.add(true);
  }
  
  /// Dispose the service
  void dispose() {
    _tokenExpiredController.close();
  }
}

/// Provider for the token expiration service
final tokenExpirationServiceProvider = Provider<TokenExpirationService>((ref) {
  return TokenExpirationService();
});
