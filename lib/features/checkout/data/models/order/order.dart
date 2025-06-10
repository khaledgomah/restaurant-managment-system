import 'dart:convert';

import 'merchant.dart';

class OrderResponse {
  int? id;
  DateTime? createdAt;
  bool? deliveryNeeded;
  Merchant? merchant;
  dynamic collector;
  int? amountCents;
  dynamic shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  dynamic merchantOrderId;
  dynamic walletNotification;
  int? paidAmountCents;
  bool? notifyUserWithEmail;
  List<dynamic>? items;
  String? orderUrl;
  int? commissionFees;
  int? deliveryFeesCents;
  int? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  String? paymentStatus;
  String? token;
  String? url;

  OrderResponse({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.merchant,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.paymentStatus,
    this.token,
    this.url,
  });

  factory OrderResponse.fromMap(Map<String, dynamic> data) => OrderResponse(
        id: data['id'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        deliveryNeeded: data['delivery_needed'] as bool?,
        merchant: data['merchant'] == null
            ? null
            : Merchant.fromMap(data['merchant'] as Map<String, dynamic>),
        collector: data['collector'] as dynamic,
        amountCents: data['amount_cents'] as int?,
        shippingData: data['shipping_data'] as dynamic,
        currency: data['currency'] as String?,
        isPaymentLocked: data['is_payment_locked'] as bool?,
        isReturn: data['is_return'] as bool?,
        isCancel: data['is_cancel'] as bool?,
        isReturned: data['is_returned'] as bool?,
        isCanceled: data['is_canceled'] as bool?,
        merchantOrderId: data['merchant_order_id'] as dynamic,
        walletNotification: data['wallet_notification'] as dynamic,
        paidAmountCents: data['paid_amount_cents'] as int?,
        notifyUserWithEmail: data['notify_user_with_email'] as bool?,
        items: data['items'] as List<dynamic>?,
        orderUrl: data['order_url'] as String?,
        commissionFees: data['commission_fees'] as int?,
        deliveryFeesCents: data['delivery_fees_cents'] as int?,
        deliveryVatCents: data['delivery_vat_cents'] as int?,
        paymentMethod: data['payment_method'] as String?,
        merchantStaffTag: data['merchant_staff_tag'] as dynamic,
        apiSource: data['api_source'] as String?,

        paymentStatus: data['payment_status'] as String?,
        token: data['token'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'delivery_needed': deliveryNeeded,
        'merchant': merchant?.toMap(),
        'collector': collector,
        'amount_cents': amountCents,
        'shipping_data': shippingData,
        'currency': currency,
        'is_payment_locked': isPaymentLocked,
        'is_return': isReturn,
        'is_cancel': isCancel,
        'is_returned': isReturned,
        'is_canceled': isCanceled,
        'merchant_order_id': merchantOrderId,
        'wallet_notification': walletNotification,
        'paid_amount_cents': paidAmountCents,
        'notify_user_with_email': notifyUserWithEmail,
        'items': items,
        'order_url': orderUrl,
        'commission_fees': commissionFees,
        'delivery_fees_cents': deliveryFeesCents,
        'delivery_vat_cents': deliveryVatCents,
        'payment_method': paymentMethod,
        'merchant_staff_tag': merchantStaffTag,
        'api_source': apiSource,
        'payment_status': paymentStatus,
        'token': token,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderResponse].
  factory OrderResponse.fromJson(String data) {
    return OrderResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
