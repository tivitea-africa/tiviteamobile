import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/rest_client/custom_rest_client_class.dart';
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
    _repo = BookingRepo(
      restClient: ref.read(restClient),
      customNetworkService: ref.read(networkServiceProvider),
    );

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
      state = state.copyWith(bookingHistoryLoadstate: LoadState.loadmore);
    }
    try {
      final response = await _repo.getBookingHistory(page: page);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(bookingHistoryLoadstate: LoadState.success);
      if (response.data?.results?.isEmpty ?? false) {
        return;
      }
      final bookingHistoryList = response.data?.results ?? [];
      final hasMorePages =
          (response.data?.page ?? 0) < (response.data?.totalPages ?? 1);

      if (bookingHistoryList.isEmpty) {
        state = state.copyWith(
          bookingHistoryLoadstate: hasMorePages ? LoadState.success : LoadState.done,
        );
        return;
      }

      state = state.copyWith(
        bookingHistoryLoadstate: hasMorePages ? LoadState.success : LoadState.done,
        bookingHistoryList: loadmore
            ? [...state.bookingHistoryList, ...bookingHistoryList]
            : bookingHistoryList,
      );
      debugLog(response.data ?? '');
    } catch (e) {
      state = state.copyWith(bookingHistoryLoadstate: LoadState.error);
    }
  }

  void generateBookingTicket(
    String bookingId, {
    required Function(File) onSuccess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(generateTicketLoadState: LoadState.loading);
    try {
      final result = await _repo.generateBookingTicket(bookingId);
      if (result.isSuccess() == false) throw result.message ?? '';

      state = state.copyWith(
        generateTicketLoadState: LoadState.success,
      );
      if (result.data != null) {
        onSuccess(result.data!);
      }
    } catch (e) {
      state = state.copyWith(generateTicketLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
