import 'dart:convert';

import 'parser.dart';

class WoItems {
  WoItems({
    required this.woItemId,
    required this.itemName,
    required this.itemType,
    required this.uom,
    required this.quantity,
    required this.totalAmount,
  });

  factory WoItems.fromMap(Map<String, dynamic> m) {
    return WoItems(
      woItemId: parseString(m['woItemId']),
      itemName: parseString(m['itemName']),
      itemType: parseString(m['itemType']),
      uom: parseString(m['uom']),
      quantity: parseDouble(m['quantity']),
      totalAmount: parseDouble(m['totalAmount']),
    );
  }

  String woItemId;
  String itemName;
  String itemType;
  String uom;
  double quantity;
  double totalAmount;

  Map<String, dynamic> toMap() => {
        'woItemId': woItemId,
        'itemName': itemName,
        'itemType': itemType,
        'uom': uom,
        'quantity': quantity,
        'totalAmount': totalAmount,
      };

  @override
  String toString() => jsonEncode(toMap());

  WoItems copyWith({
    String? woItemId,
    String? itemName,
    String? itemType,
    String? uom,
    double? quantity,
    double? totalAmount,
  }) =>
      WoItems(
        woItemId: woItemId ?? this.woItemId,
        itemName: itemName ?? this.itemName,
        itemType: itemType ?? this.itemType,
        uom: uom ?? this.uom,
        quantity: quantity ?? this.quantity,
        totalAmount: totalAmount ?? this.totalAmount,
      );

  /// Raw Json from which class WoItems is generated
/*
{
    "woItemId": "0c3669de-914b-49f7-aaa5-99dec4d1cbd7",
    "itemName": "Exterior Wash",
    "itemType": "Service",
    "uom": "Vehicle",
    "quantity": 1,
    "totalAmount": 300
}
*/
}
