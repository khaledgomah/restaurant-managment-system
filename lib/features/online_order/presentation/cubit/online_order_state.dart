part of 'online_order_cubit.dart';

class OnlineOrderState {
  final OrdersStates ordersStates;
  final List<OnlineOrder>? pendingOrders;
  final List<OnlineOrder>? completedOrders;
  const OnlineOrderState({
    required this.ordersStates,
    this.pendingOrders,
    this.completedOrders,
  });

  OnlineOrderState copyWith({
    OrdersStates? ordersStates,
    List<OnlineOrder>? pendingOrders,
    List<OnlineOrder>? completedOrders,
  }) {
    return OnlineOrderState(
      ordersStates: ordersStates ?? this.ordersStates,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      completedOrders: completedOrders ?? this.completedOrders,
    );
  }
}

enum OrdersStates { loading, success, failure }

extension OrdersStatus on OnlineOrderState {
  bool get isOrderLoading => ordersStates == OrdersStates.loading;
  bool get isOrderSuccess => ordersStates == OrdersStates.success;
  bool get isOrderFail => ordersStates == OrdersStates.failure;
}