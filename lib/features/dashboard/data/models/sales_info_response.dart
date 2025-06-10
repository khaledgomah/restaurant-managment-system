// ignore_for_file: public_member_api_docs, sort_constructors_first

class SalesInfoResponse {
  final double totalRevenue;
  final int totalOrders;
  final int walkIns;
  final int onlineOrders;
  factory SalesInfoResponse.fromMap(Map<String, dynamic> map) {
    return SalesInfoResponse(
      totalRevenue: map['total_revenue'] as double,
      totalOrders: map['total_orders'] as int,
      walkIns: map['walk_ins'] as int,
      onlineOrders: map['online_orders'] as int,
    );
  }
  SalesInfoResponse(
      {required this.totalRevenue,
      required this.totalOrders,
      required this.walkIns,
      required this.onlineOrders});

  @override
  String toString() {
    return 'SalesInfoResponse(totalRevenue: $totalRevenue, totalOrders: $totalOrders, walkIns: $walkIns, onlineOrders: $onlineOrders)';
  }
}
