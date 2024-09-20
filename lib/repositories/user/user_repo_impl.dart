import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage_impl.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/models/user_model.dart';
import 'package:tivi_tea/repositories/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

class UserRepoImpl implements UserRepository {
  UserRepoImpl(
    this._storage,
    this._ref,
    this._restClient,
  );
  final LocalStorage _storage;
  final Ref _ref;
  final RestClient _restClient;
  @override
  CurrentState getCurrentState() {
    // TODO: implement getCurrentState
    throw UnimplementedError();
  }

  @override
  String getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  bool? getRememberMe() {
    // TODO: implement getRememberMe
    throw UnimplementedError();
  }

  @override
  String getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  User getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  void saveCurrentState(CurrentState val) {
    // TODO: implement saveCurrentState
  }

  @override
  void saveRefreshToken(String token) {
    // TODO: implement saveRefreshToken
  }

  @override
  void saveRememberMe(bool val) {
    // TODO: implement saveRememberMe
  }

  @override
  void saveToken(String token) {
    // TODO: implement saveToken
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepoImpl(ref.read(localDB), ref, ref.read(restClient)),
);

final currentUserProvider = Provider<User>((ref) {
  final user = ref.read(userRepositoryProvider).getUser();
  return user;
});
