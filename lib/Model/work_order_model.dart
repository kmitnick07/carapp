class WorkOrder {
  final String? workOrderId;
  final String? woCreatedDate;
  final String? woInvoiceNo;
  final String? woCurrentStatus;
  final String? customerName;
  final String? customerPhoneNumber;
  final String? verifiedCustomer;
  final String? vehicleNumber;
  final String? vehicleMake;
  final String? vehicleModel;
  final dynamic vehicleFuelType;
  final String? branchName;
  final dynamic businessTradeName;
  final dynamic businessGSTINNumber;
  final int? subTotal;
  final int? totalDiscount;
  final int? totalGSTAmount;
  final int? totalAmount;
  final int? totalPaidAmount;
  final int? totalDueAmount;
  final int? returnChangeAmount;
  final String? woItemsJSON;
  final List<WoItems>? woItems;
  final String? woPaymentsJSON;
  final List<WoPayments>? woPayments;

  WorkOrder({
    this.workOrderId,
    this.woCreatedDate,
    this.woInvoiceNo,
    this.woCurrentStatus,
    this.customerName,
    this.customerPhoneNumber,
    this.verifiedCustomer,
    this.vehicleNumber,
    this.vehicleMake,
    this.vehicleModel,
    this.vehicleFuelType,
    this.branchName,
    this.businessTradeName,
    this.businessGSTINNumber,
    this.subTotal,
    this.totalDiscount,
    this.totalGSTAmount,
    this.totalAmount,
    this.totalPaidAmount,
    this.totalDueAmount,
    this.returnChangeAmount,
    this.woItemsJSON,
    this.woItems,
    this.woPaymentsJSON,
    this.woPayments,
  });

  WorkOrder.fromJson(Map<String, dynamic> json)
      : workOrderId = json['workOrderId'] as String?,
        woCreatedDate = json['woCreatedDate'] as String?,
        woInvoiceNo = json['woInvoiceNo'] as String?,
        woCurrentStatus = json['woCurrentStatus'] as String?,
        customerName = json['customerName'] as String?,
        customerPhoneNumber = json['customerPhoneNumber'] as String?,
        verifiedCustomer = json['verifiedCustomer'] as String?,
        vehicleNumber = json['vehicleNumber'] as String?,
        vehicleMake = json['vehicleMake'] as String?,
        vehicleModel = json['vehicleModel'] as String?,
        vehicleFuelType = json['vehicleFuelType'],
        branchName = json['branchName'] as String?,
        businessTradeName = json['businessTradeName'],
        businessGSTINNumber = json['businessGSTINNumber'],
        subTotal = json['subTotal'] as int?,
        totalDiscount = json['totalDiscount'] as int?,
        totalGSTAmount = json['totalGSTAmount'] as int?,
        totalAmount = json['totalAmount'] as int?,
        totalPaidAmount = json['totalPaidAmount'] as int?,
        totalDueAmount = json['totalDueAmount'] as int?,
        returnChangeAmount = json['returnChangeAmount'] as int?,
        woItemsJSON = json['woItemsJSON'] as String?,
        woItems = (json['woItems'] as List?)?.map((dynamic e) => WoItems.fromJson(e as Map<String,dynamic>)).toList(),
        woPaymentsJSON = json['woPaymentsJSON'] as String?,
        woPayments = (json['woPayments'] as List?)?.map((dynamic e) => WoPayments.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'workOrderId' : workOrderId,
    'woCreatedDate' : woCreatedDate,
    'woInvoiceNo' : woInvoiceNo,
    'woCurrentStatus' : woCurrentStatus,
    'customerName' : customerName,
    'customerPhoneNumber' : customerPhoneNumber,
    'verifiedCustomer' : verifiedCustomer,
    'vehicleNumber' : vehicleNumber,
    'vehicleMake' : vehicleMake,
    'vehicleModel' : vehicleModel,
    'vehicleFuelType' : vehicleFuelType,
    'branchName' : branchName,
    'businessTradeName' : businessTradeName,
    'businessGSTINNumber' : businessGSTINNumber,
    'subTotal' : subTotal,
    'totalDiscount' : totalDiscount,
    'totalGSTAmount' : totalGSTAmount,
    'totalAmount' : totalAmount,
    'totalPaidAmount' : totalPaidAmount,
    'totalDueAmount' : totalDueAmount,
    'returnChangeAmount' : returnChangeAmount,
    'woItemsJSON' : woItemsJSON,
    'woItems' : woItems?.map((e) => e.toJson()).toList(),
    'woPaymentsJSON' : woPaymentsJSON,
    'woPayments' : woPayments?.map((e) => e.toJson()).toList()
  };
}

class WoItems {
  final String? woItemId;
  final String? itemName;
  final String? itemType;
  final String? uom;
  final double? quantity;
  final double? totalAmount;

  WoItems({
    this.woItemId,
    this.itemName,
    this.itemType,
    this.uom,
    this.quantity,
    this.totalAmount,
  });

  WoItems.fromJson(Map<String, dynamic> json)
      : woItemId = json['woItemId'] as String?,
        itemName = json['itemName'] as String?,
        itemType = json['itemType'] as String?,
        uom = json['uom'] as String?,
        quantity = json['quantity'] as double?,
        totalAmount = json['totalAmount'] as double?;

  Map<String, dynamic> toJson() => {
    'woItemId' : woItemId,
    'itemName' : itemName,
    'itemType' : itemType,
    'uom' : uom,
    'quantity' : quantity,
    'totalAmount' : totalAmount
  };
}

class WoPayments {
  final String? woPaymentId;
  final String? paymentDate;
  final String? paymentMethod;
  final String? reference;
  final double? paymentAmt;

  WoPayments({
    this.woPaymentId,
    this.paymentDate,
    this.paymentMethod,
    this.reference,
    this.paymentAmt,
  });

  WoPayments.fromJson(Map<String, dynamic> json)
      : woPaymentId = json['woPaymentId'] as String?,
        paymentDate = json['paymentDate'] as String?,
        paymentMethod = json['paymentMethod'] as String?,
        reference = json['reference'] as String?,
        paymentAmt = json['paymentAmt'] as double?;

  Map<String, dynamic> toJson() => {
    'woPaymentId' : woPaymentId,
    'paymentDate' : paymentDate,
    'paymentMethod' : paymentMethod,
    'reference' : reference,
    'paymentAmt' : paymentAmt
  };
}