import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'onboarding_notifier.g.dart';

@riverpod
bool getRememberUserStatus(GetRememberUserStatusRef ref) {
  return ref.read(userRepositoryProvider).getRememberMe() ?? false;
}