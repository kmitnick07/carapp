import 'dart:convert';

import 'parser.dart';

class WoPayments {
  WoPayments({
    required this.woPaymentId,
    required this.paymentDate,
    required this.paymentMethod,
    required this.reference,
    required this.paymentAmt,
  });

  factory WoPayments.fromMap(Map<String, dynamic> m) {
    return WoPayments(
      woPaymentId: parseString(m['woPaymentId']),
      paymentDate: parseString(m['paymentDate']),
      paymentMethod: parseString(m['paymentMethod']),
      reference: parseString(m['reference']),
      paymentAmt: parseDouble(m['paymentAmt']),
    );
  }

  String woPaymentId;
  String paymentDate;
  String paymentMethod;
  String reference;
  double paymentAmt;

  Map<String, dynamic> toMap() => {
        'woPaymentId': woPaymentId,
        'paymentDate': paymentDate,
        'paymentMethod': paymentMethod,
        'reference': reference,
        'paymentAmt': paymentAmt,
      };

  @override
  String toString() => jsonEncode(toMap());

  WoPayments copyWith({
    String? woPaymentId,
    String? paymentDate,
    String? paymentMethod,
    String? reference,
    double? paymentAmt,
  }) =>
      WoPayments(
        woPaymentId: woPaymentId ?? this.woPaymentId,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        reference: reference ?? this.reference,
        paymentAmt: paymentAmt ?? this.paymentAmt,
      );

  /// Raw Json from which class WoPayments is generated
/*
{
    "woPaymentId": "32eb8fff-102e-4f57-85b1-924b132e9361",
    "paymentDate": "24-Sep-2024 (10:13 PM)",
    "paymentMethod": "Debit/Credit Card",
    "reference": "",
    "paymentAmt": 354
}
*/
}
