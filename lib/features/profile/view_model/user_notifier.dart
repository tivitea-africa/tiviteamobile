import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/models/user_model.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  late final UserRepository _userRepo;

  @override
  User build() {
    _userRepo = ref.read(userRepositoryProvider);
    return _userRepo.getUser();
  }

  void refreshUser() => state = _userRepo.getUser();

  void updateUser(User? newUser) => state = newUser ?? state;
}
