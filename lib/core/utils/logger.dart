import 'dart:developer';

import 'package:flutter/foundation.dart';

void debugLog(dynamic message) {
  if (kDebugMode) {
    log('DEBUG: $message');
  }
}
