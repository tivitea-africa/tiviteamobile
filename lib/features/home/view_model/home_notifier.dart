import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifer extends _$HomeNotifer {
  @override
  HomeState build() => HomeState.initial();

  void selectCategory(String? categoryId, {
    required void Function(String) onSelected,
  }) {
    if (categoryId == null) {
      return;
    }
    state = state.copyWith(selectedCategoryId: categoryId);
    onSelected(categoryId);
  }
}

class HomeState {
  HomeState({this.selectedCategoryId});
  factory HomeState.initial() {
    return HomeState();
  }
  final String? selectedCategoryId;

  HomeState copyWith({
    String? selectedCategoryId,
  }) {
    return HomeState(
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}
