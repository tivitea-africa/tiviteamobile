import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Currency { NGN, USD }

extension CurrencyText on num? {
  Widget getCurrencyText({
    Currency currency = Currency.NGN,
    TextStyle? style,
    int? maxLines,
  }) {
    final curr = switch (currency) {
      Currency.USD => r'$',
      Currency.NGN => '₦',
    };

    return Text.rich(
      TextSpan(
        text: '',
        children: [
          TextSpan(
            text: curr,
            style: style?.copyWith(
              fontFamily: '',
            ),
          ),
          TextSpan(
            text: formatAmount,
            style: style,
          ),
        ],
      ),
    );
  }

  String get formatAmount {
    if (this == null) {
      return '';
    }
    return NumberFormat.currency(
      name: '',
      decimalDigits: isInteger(this!) ? 0 : 2,
    ).format(this);
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();
}
