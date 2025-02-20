import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
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
    required void Function(String bookingId) onSuccess,
    required void Function(String) onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.bookWorkspace(listingId, data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (response.data != null) {
        onSuccess(response.data?.id ?? '');
      }
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      onError(e.toString());
    }
  }

  void bookWorktool({
    required String listingId,
    required BookWorkToolModel data,
    required Function(String bookingId) onSuccess,
    required void Function(String) onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.bookWorktool(listingId, data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (response.data != null) {
        onSuccess(response.data?.id ?? '');
      }
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      onError(e.toString());
    }
  }

  void getBookingHistory({required int page, bool loadmore = false}) async {
    if (loadmore) {
      state = state.copyWith(loadState: LoadState.loadmore);
    }
    try {
      final response = await _repo.getBookingHistory(page: page);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (response.data?.results?.isEmpty ?? false) {
        return;
      }
      final bookingHistoryList = response.data?.results ?? [];
      final hasMorePages =
          (response.data?.page ?? 0) < (response.data?.totalPages ?? 1);

      if (bookingHistoryList.isEmpty) {
        state = state.copyWith(
          loadState: hasMorePages ? LoadState.success : LoadState.done,
        );
        return;
      }

      state = state.copyWith(
        loadState: hasMorePages ? LoadState.success : LoadState.done,
        bookingHistoryList: loadmore
            ? [...state.bookingHistoryList, ...bookingHistoryList]
            : bookingHistoryList,
      );
      debugLog(response.data ?? '');
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
    }
  }
}
