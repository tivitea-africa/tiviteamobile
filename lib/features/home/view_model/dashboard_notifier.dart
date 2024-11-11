import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/home/model/client/client_dashboard_model.dart';
import 'package:tivi_tea/features/home/model/service_provider/service_provider_dashboard_model.dart';
import 'package:tivi_tea/repositories/dashboard/client/client_dashboard_repo.dart';
import 'package:tivi_tea/repositories/dashboard/service_provider/service_provider_dashboard_repo.dart';

part 'dashboard_notifier.g.dart';

@riverpod
class DashboardNotifer extends _$DashboardNotifer {
  late ServiceProviderDashBoardRepo _repo;
  late ClientDashBoardRepo _clientRepo;
  @override
  DashboardState build() {
    _repo = ServiceProviderDashBoardRepo(restClient: ref.read(restClient));
    _clientRepo = ClientDashBoardRepo(restClient: ref.read(restClient));
    return DashboardState.initial();
  }

  void getServiceProviderDashboardDetails() async {
    try {
      final result = await _repo.getServiceProviderDashboard();
      if (result.isSuccess() == false) throw result.error?.message ?? '';
      state = state.copyWith(
        model: result.data,
        dashboardLoadState: LoadState.success,
      );
    } catch (e) {
      debugLog(e.toString());
    }
  }

  void getClientDashboardDetails() async {
    try {
      final result = await _clientRepo.getClientDashboard();
      if (result.isSuccess() == false) throw result.error?.message ?? '';
      state = state.copyWith(
        clientDashboardModel: result.data,
        dashboardLoadState: LoadState.success,
      );
    } catch (e) {
      debugLog(e.toString());
    }
  }
}

class DashboardState {
  DashboardState({
    required this.dashboardLoadState,
    this.model,
    this.clientDashboardModel,
  });
  factory DashboardState.initial() {
    return DashboardState(
      dashboardLoadState: LoadState.loading,
    );
  }
  final LoadState dashboardLoadState;
  final ServiceProviderDashboardModel? model;
  final ClientDashboardModel? clientDashboardModel;

  DashboardState copyWith({
    LoadState? dashboardLoadState,
    ServiceProviderDashboardModel? model,
    ClientDashboardModel? clientDashboardModel,
  }) {
    return DashboardState(
      dashboardLoadState: dashboardLoadState ?? this.dashboardLoadState,
      clientDashboardModel: clientDashboardModel ?? this.clientDashboardModel,
      model: model ?? this.model,
    );
  }
}
