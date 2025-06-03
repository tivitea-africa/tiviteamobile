class PaymentHistoryModel {
  final String customer;
  final String service;
  final String status;
  final String date;

  PaymentHistoryModel({
    required this.customer,
    required this.service,
    required this.status,
    required this.date,
  });
}