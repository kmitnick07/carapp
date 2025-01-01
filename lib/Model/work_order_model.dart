import 'dart:convert';

import 'package:apna_wash/Model/wo_item_model.dart';
import 'package:apna_wash/Model/wo_payment_model.dart';

import 'parser.dart';

class WorkOrder {
  WorkOrder({
    required this.workOrderId,
    required this.woCreatedDate,
    required this.woInvoiceNo,
    required this.woCurrentStatus,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.verifiedCustomer,
    required this.vehicleNumber,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.vehicleFuelType,
    required this.branchName,
    required this.businessTradeName,
    required this.businessGSTINNumber,
    required this.subTotal,
    required this.discount,
    required this.otherDiscount,
    required this.totalGSTAmount,
    required this.totalAmount,
    required this.totalPaidAmount,
    required this.totalDueAmount,
    required this.returnChangeAmount,
    required this.woItemsJSON,
    required this.woItems,
    required this.woPaymentsJSON,
    required this.woPayments,
  });

  factory WorkOrder.fromMap(Map<String, dynamic> m) {
    return WorkOrder(
      workOrderId: parseString(m['workOrderId']),
      woCreatedDate: parseString(m['woCreatedDate']),
      woInvoiceNo: parseString(m['woInvoiceNo']),
      woCurrentStatus: parseString(m['woCurrentStatus']),
      customerName: parseString(m['customerName']),
      customerPhoneNumber: parseString(m['customerPhoneNumber']),
      verifiedCustomer: parseString(m['verifiedCustomer']),
      vehicleNumber: parseString(m['vehicleNumber']),
      vehicleMake: parseString(m['vehicleMake']),
      vehicleModel: parseString(m['vehicleModel']),
      vehicleFuelType: parseString(m['vehicleFuelType']),
      branchName: parseString(m['branchName']),
      businessTradeName: parseString(m['businessTradeName']),
      businessGSTINNumber: parseString(m['businessGSTINNumber']),
      subTotal: parseDouble(m['subTotal']),
      discount: parseDouble(m['discount']),
      otherDiscount: parseDouble(m['otherDiscount']),
      totalGSTAmount: parseDouble(m['totalGSTAmount']),
      totalAmount: parseDouble(m['totalAmount']),
      totalPaidAmount: parseDouble(m['totalPaidAmount']),
      totalDueAmount: parseDouble(m['totalDueAmount']),
      returnChangeAmount: parseDouble(m['returnChangeAmount']),
      woItemsJSON: parseString(m['woItemsJSON']),
      woItems: parseList(m['woItems'], (e) => WoItems.fromMap(e ?? {})),
      woPaymentsJSON: parseString(m['woPaymentsJSON']),
      woPayments:
      parseList(m['woPayments'], (e) => WoPayments.fromMap(e ?? {})),
    );
  }

  String workOrderId;
  String woCreatedDate;
  String woInvoiceNo;
  String woCurrentStatus;
  String customerName;
  String customerPhoneNumber;
  String verifiedCustomer;
  String vehicleNumber;
  String vehicleMake;
  String vehicleModel;
  String vehicleFuelType;
  String branchName;
  String businessTradeName;
  String businessGSTINNumber;
  double subTotal;
  double discount;
  double otherDiscount;
  double totalGSTAmount;
  double totalAmount;
  double totalPaidAmount;
  double totalDueAmount;
  double returnChangeAmount;
  String woItemsJSON;
  List<WoItems> woItems;
  String woPaymentsJSON;
  List<WoPayments> woPayments;

  Map<String, dynamic> toMap() => {
    'workOrderId': workOrderId,
    'woCreatedDate': woCreatedDate,
    'woInvoiceNo': woInvoiceNo,
    'woCurrentStatus': woCurrentStatus,
    'customerName': customerName,
    'customerPhoneNumber': customerPhoneNumber,
    'verifiedCustomer': verifiedCustomer,
    'vehicleNumber': vehicleNumber,
    'vehicleMake': vehicleMake,
    'vehicleModel': vehicleModel,
    'vehicleFuelType': vehicleFuelType,
    'branchName': branchName,
    'businessTradeName': businessTradeName,
    'businessGSTINNumber': businessGSTINNumber,
    'subTotal': subTotal,
    'discount': discount,
    'otherDiscount': otherDiscount,
    'totalGSTAmount': totalGSTAmount,
    'totalAmount': totalAmount,
    'totalPaidAmount': totalPaidAmount,
    'totalDueAmount': totalDueAmount,
    'returnChangeAmount': returnChangeAmount,
    'woItemsJSON': woItemsJSON,
    'woItems': woItems,
    'woPaymentsJSON': woPaymentsJSON,
    'woPayments': woPayments,
  };

  @override
  String toString() => jsonEncode(toMap());

  WorkOrder copyWith({
    String? workOrderId,
    String? woCreatedDate,
    String? woInvoiceNo,
    String? woCurrentStatus,
    String? customerName,
    String? customerPhoneNumber,
    String? verifiedCustomer,
    String? vehicleNumber,
    String? vehicleMake,
    String? vehicleModel,
    String? vehicleFuelType,
    String? branchName,
    String? businessTradeName,
    String? businessGSTINNumber,
    double? subTotal,
    double? discount,
    double? otherDiscount,
    double? totalGSTAmount,
    double? totalAmount,
    double? totalPaidAmount,
    double? totalDueAmount,
    double? returnChangeAmount,
    String? woItemsJSON,
    List<WoItems>? woItems,
    String? woPaymentsJSON,
    List<WoPayments>? woPayments,
  }) =>
      WorkOrder(
        workOrderId: workOrderId ?? this.workOrderId,
        woCreatedDate: woCreatedDate ?? this.woCreatedDate,
        woInvoiceNo: woInvoiceNo ?? this.woInvoiceNo,
        woCurrentStatus: woCurrentStatus ?? this.woCurrentStatus,
        customerName: customerName ?? this.customerName,
        customerPhoneNumber: customerPhoneNumber ?? this.customerPhoneNumber,
        verifiedCustomer: verifiedCustomer ?? this.verifiedCustomer,
        vehicleNumber: vehicleNumber ?? this.vehicleNumber,
        vehicleMake: vehicleMake ?? this.vehicleMake,
        vehicleModel: vehicleModel ?? this.vehicleModel,
        vehicleFuelType: vehicleFuelType ?? this.vehicleFuelType,
        branchName: branchName ?? this.branchName,
        businessTradeName: businessTradeName ?? this.businessTradeName,
        businessGSTINNumber: businessGSTINNumber ?? this.businessGSTINNumber,
        subTotal: subTotal ?? this.subTotal,
        discount: discount ?? this.discount,
        otherDiscount: otherDiscount ?? this.otherDiscount,
        totalGSTAmount: totalGSTAmount ?? this.totalGSTAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        totalPaidAmount: totalPaidAmount ?? this.totalPaidAmount,
        totalDueAmount: totalDueAmount ?? this.totalDueAmount,
        returnChangeAmount: returnChangeAmount ?? this.returnChangeAmount,
        woItemsJSON: woItemsJSON ?? this.woItemsJSON,
        woItems: woItems ?? this.woItems,
        woPaymentsJSON: woPaymentsJSON ?? this.woPaymentsJSON,
        woPayments: woPayments ?? this.woPayments,
      );

/// Raw Json from which class WorkOrder is generated
/*
{
    "workOrderId": "ba483cb0-46fb-4245-8f6e-a3d6cbd3c400",
    "woCreatedDate": "08-Sep-2024 (02:55 AM)",
    "woInvoiceNo": "GST/24/09/A2/016",
    "woCurrentStatus": "Payment Details",
    "customerName": "Mayur Vaghasiya",
    "customerPhoneNumber": "9898232801",
    "verifiedCustomer": "No",
    "vehicleNumber": "GJ05RE2033",
    "vehicleMake": "Hyundai",
    "vehicleModel": "Creta",
    "vehicleFuelType": "Diesel",
    "branchName": "VESU BRANCH",
    "businessTradeName": null,
    "businessGSTINNumber": null,
    "subTotal": 300,
    "discount": 0,
    "otherDiscount": 0,
    "totalGSTAmount": 54,
    "totalAmount": 354,
    "totalPaidAmount": 354,
    "totalDueAmount": 0,
    "returnChangeAmount": 0,
    "woItemsJSON": "[{\"WOItemId\":\"0c3669de-914b-49f7-aaa5-99dec4d1cbd7\",\"Quantity\":1.00,\"UOM\":\"Vehicle\",\"ItemType\":\"Service\",\"ItemName\":\"Exterior Wash\",\"TotalAmount\":300.00}]",
    "woItems": [
        {
            "woItemId": "0c3669de-914b-49f7-aaa5-99dec4d1cbd7",
            "itemName": "Exterior Wash",
            "itemType": "Service",
            "uom": "Vehicle",
            "quantity": 1,
            "totalAmount": 300
        }
    ],
    "woPaymentsJSON": "[{\"WOPaymentId\":\"32eb8fff-102e-4f57-85b1-924b132e9361\",\"PaymentDate\":\"24-Sep-2024 (10:13 PM)\",\"PaymentAmt\":354.00,\"PaymentMethod\":\"Debit/Credit Card\",\"Reference\":\"\"}]",
    "woPayments": [
        {
            "woPaymentId": "32eb8fff-102e-4f57-85b1-924b132e9361",
            "paymentDate": "24-Sep-2024 (10:13 PM)",
            "paymentMethod": "Debit/Credit Card",
            "reference": "",
            "paymentAmt": 354
        }
    ]
}
*/
}
