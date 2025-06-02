import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/rest_client/custom_rest_client_class.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/models/paginator_selector_model.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
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

  void getBookingHistory({required int page}) async {
    if (state.pageCache.containsKey(page)) {
      state = state.copyWith(
        bookingHistoryLoadstate: LoadState.success,
        bookingHistoryList: state.pageCache[page] ?? [],
      );
      return;
    }

    state = state.copyWith(bookingHistoryLoadstate: LoadState.loading);
    
    try {
      final response = await _repo.getBookingHistory(page: page);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }

      final bookingHistoryList = response.data?.results ?? [];
      
      final paginatorSelectorModel = PaginatorSelectorModel(
        currentPage: page,
        totalPages: response.data?.totalPages ?? 1,
        totalItems: response.data?.totalItems ?? 0,
      );

      final updatedCache = Map<int, List<BookingHistoryModel>>.from(state.pageCache);
      updatedCache[page] = bookingHistoryList;

      state = state.copyWith(
        bookingHistoryLoadstate: LoadState.success,
        paginatorSelectorModel: paginatorSelectorModel,
        bookingHistoryList: bookingHistoryList,
        pageCache: updatedCache,
      );

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
