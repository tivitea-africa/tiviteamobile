import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/services/model/bank_model.dart';
import 'package:tivi_tea/features/services/model/create_transfer_recipient_model.dart';
import 'package:tivi_tea/features/services/model/create_transfer_recipient_response.dart';
import 'package:tivi_tea/features/services/model/get_account_details_request_body.dart';
import 'package:tivi_tea/features/services/model/get_account_details_response.dart';
import 'package:tivi_tea/repositories/services/service_provider/service_provider_services_repo.dart';

part 'bank_notifier.g.dart';

class BankOperationState {
  BankOperationState({
    required this.listBankLoadState,
    required this.getAccountLoadState,
    required this.createTransferRecipientLoadState,
    required this.banks,
  });
  factory BankOperationState.initial() {
    return BankOperationState(
      listBankLoadState: LoadState.loading,
      getAccountLoadState: LoadState.idle,
      createTransferRecipientLoadState: LoadState.idle,
      banks: [],
    );
  }
  final LoadState listBankLoadState;
  final LoadState getAccountLoadState;
  final LoadState createTransferRecipientLoadState;
  final List<BankModel> banks;

  BankOperationState copyWith({
    LoadState? listBankLoadState,
    LoadState? getAccountLoadState,
    LoadState? createTransferRecipientLoadState,
    List<BankModel>? banks,
  }) {
    return BankOperationState(
      listBankLoadState: listBankLoadState ?? this.listBankLoadState,
      getAccountLoadState: getAccountLoadState ?? this.getAccountLoadState,
      createTransferRecipientLoadState: createTransferRecipientLoadState ??
          this.createTransferRecipientLoadState,
      banks: banks ?? this.banks,
    );
  }
}

@riverpod
class BankOperationNotifier extends _$BankOperationNotifier {
  late final ServiceProviderServicesRepo _repo;
  @override
  BankOperationState build() {
    _repo = ServiceProviderServicesRepo(restClient: ref.read(restClient));
    return BankOperationState.initial();
  }

  void getBanks() async {
    state = state.copyWith(listBankLoadState: LoadState.loading);
    try {
      final response = await _repo.getBanks();
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(
        listBankLoadState: LoadState.success,
        banks: response.data?.data ?? [],
      );
    } catch (e) {
      state = state.copyWith(listBankLoadState: LoadState.error);
    }
  }

  void getAccountDetails({
    required GetAccountDetailsRequestBody data,
    required void Function(GetAccountDetailsResponse) onSuccess,
  }) async {
    state = state.copyWith(getAccountLoadState: LoadState.loading);
    try {
      final response = await _repo.getAccountDetails(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(getAccountLoadState: LoadState.success);
      if (response.data != null) {
        onSuccess(response.data!);
      }
    } catch (e) {
      state = state.copyWith(getAccountLoadState: LoadState.error);
    }
  }

  void createTransferRecipient({
    required CreateTransferRecipientModel data,
    required void Function(CreateTransferRecipientResponse) onSuccess,
    required void Function(String) onError,
  }) async {
    state = state.copyWith(createTransferRecipientLoadState: LoadState.loading);
    try {
      final response = await _repo.createTransferRecipient(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(
        createTransferRecipientLoadState: LoadState.success,
      );
      onSuccess(response.data!);
    } catch (e) {
      state = state.copyWith(createTransferRecipientLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
