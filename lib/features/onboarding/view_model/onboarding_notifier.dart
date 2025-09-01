import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'onboarding_notifier.g.dart';

@riverpod
bool getRememberUserStatus(Ref ref) {
  return ref.read(userRepositoryProvider).getRememberMe() ?? false;
}