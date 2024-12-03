import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage_impl.dart';
import 'package:tivi_tea/core/services/local_storage/storage_keys.dart';
import 'package:tivi_tea/models/user_model.dart';
import 'package:tivi_tea/repositories/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

class UserRepoImpl implements UserRepository {
  UserRepoImpl(this._storage);
  final LocalStorage _storage;

  @override
  void saveCurrentState(CurrentState val) async {
    await _storage.put(HiveKeys.currentState, val.name);
  }

  @override
  CurrentState getCurrentState() {
    switch (_storage.get(HiveKeys.currentState) ?? CurrentState.initial.name) {
      case 'onboarded':
        return CurrentState.onboarded;
      case 'loggedIn':
        return CurrentState.loggedIn;
      default:
        return CurrentState.initial;
    }
  }

  @override
  void saveRememberMe(bool val) async {
    await _storage.put(HiveKeys.rememberMe, val);
  }

  @override
  bool? getRememberMe() {
    return _storage.get<bool>(HiveKeys.rememberMe) ?? false;
  }

  @override
  String getToken() {
    return _storage.get(HiveKeys.token) as String? ?? '';
  }

  @override
  String getRefreshToken() {
    return _storage.get(HiveKeys.refreshToken) as String? ?? '';
  }

  @override
  void saveRefreshToken(String token) async {
    await _storage.put(HiveKeys.refreshToken, token);
  }

  @override
  void saveToken(String token) async {
    await _storage.put(HiveKeys.token, token);
  }

  @override
  User getUser() {
    final response = _storage.get<String?>(HiveKeys.user);
    final user = User.fromJson(
      response == null
          ? {}
          : json.decode(response as String) as Map<String, dynamic>,
    );
    return user;
  }

  @override
  Future<void> saveUser(User? user) async {
    if (user == null) {
      return;
    }
    await _storage.put(HiveKeys.user, json.encode(user));
  }

  @override
  void saveKYCVerificationStatus(KYCVerificationStatus val) async {
    await _storage.put(HiveKeys.kycVerificationStatus, val.name);
  }

  @override
  KYCVerificationStatus getKYCVerificationStatus() {
    switch (_storage.get(HiveKeys.kycVerificationStatus) ??
        CurrentState.initial.name) {
      case 'documentsSubmitted':
        return KYCVerificationStatus.documentsSubmitted;
      case 'documentsVerified':
        return KYCVerificationStatus.documentsVerified;
      default:
        return KYCVerificationStatus.documentsSubmitted;
    }
  }

  @override
  Future<void> clearLocalUserInfo() async {
    await _storage.clear();
  }
}

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepoImpl(ref.read(localDB)),
);

// final currentUserProvider = StateProvider<User>((ref) {
//   final user = ref.read(userRepositoryProvider).getUser();
//   return user;
// });
