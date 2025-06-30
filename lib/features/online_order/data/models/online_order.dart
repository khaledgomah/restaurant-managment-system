// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class OnlineOrder {
  final bool isPaid;
  final num price;
  final String status;
  final int orderId;
  final Timestamp createdAt;
  final Map<String, int> order;
  OnlineOrder({
    this.isPaid = true,
    required this.price, 
    required this.status,
    required this.orderId,
    required this.createdAt,
    required this.order,
  });

  @override
  String toString() =>
      'OnlineOrder(status: $status, orderId: $orderId, createdAt: $createdAt, order: $order, price: $price)';

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'isPaid': isPaid,
      'status': status,
      'orderId': orderId,
      'order': order,
      'createdAt': createdAt,
    };
  }

  OnlineOrder copyWith({
    num? price,
    bool? isPaid,
    int? orderId,
    Timestamp? createdAt,
    Map<String, int>? order,
  }) {
    return OnlineOrder(
      price: price ??this.price,
      status: status,
      orderId: orderId ?? this.orderId,
      createdAt: createdAt ?? this.createdAt,
      order: order ?? this.order,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  factory OnlineOrder.fromMap(Map<String, dynamic> map) {
    return OnlineOrder(
      price:map['price'] ??0 ,
      isPaid: map['isPaid'] ?? true,
      status: map['status'] as String,
      orderId: map['orderId'] as int,
      createdAt: map['createdAt'],
      order: Map<String, int>.from(
        (map['order'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, value as int),
        ),
      ),
    );
  }

  factory OnlineOrder.fromJson(String source) =>
      OnlineOrder.fromMap(json.decode(source) as Map<String, dynamic>);
}
