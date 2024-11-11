import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/view_model/booking_state.dart';
import 'package:tivi_tea/repositories/booking/booking_repo.dart';

part 'booking_notifier.g.dart';

@riverpod
class BookingNotifer extends _$BookingNotifer {
  late final BookingRepo _repo;

  @override
  BookingState build() {
    _repo = BookingRepo(restClient: ref.read(restClient));

    return BookingState.initial();
  }

  void bookWorkSpace({
    required String listingId,
    required BookWorkSpaceModel data,
    required VoidCallback onSuccess,
    required void Function(String) onError,
  }) async {
    try {
      final response = await _repo.bookWorkspace(listingId, data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      onSuccess();
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      onError(e.toString());
    }
  }

  void bookWorktool({
    required String listingId,
    required BookWorkToolModel data,
    required VoidCallback onSuccess,
    required void Function(String) onError,
  }) async {
    try {
      final response = await _repo.bookWorktool(listingId, data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      onSuccess();
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      onError(e.toString());
    }
  }
}
