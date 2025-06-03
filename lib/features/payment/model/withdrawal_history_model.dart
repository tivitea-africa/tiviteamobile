class WithdrawalHistoryModel {
  final String id;
  final num amount;
  final String status;
  final String createdAt;

  WithdrawalHistoryModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.createdAt,
  });
}