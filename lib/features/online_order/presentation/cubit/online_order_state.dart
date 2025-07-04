part of 'online_order_cubit.dart';

class OnlineOrderState {
  final List<bool>? isDone;
  final OnlineOrder? selectedOrder;
  final OrdersStates ordersStates;
  final List<OnlineOrder>? pendingOrders;
  final List<OnlineOrder>? completedOrders;
  const OnlineOrderState({
    this.isDone,
    this.selectedOrder,
    required this.ordersStates,
    this.pendingOrders,
    this.completedOrders,
  });

  OnlineOrderState copyWith({
    bool updateSelectedOrder = false,
    List<bool>? isDone,
    OrdersStates? ordersStates,
    List<OnlineOrder>? pendingOrders,
    List<OnlineOrder>? completedOrders,
    OnlineOrder? selectedOrder,
  }) {
    return OnlineOrderState(
      isDone: isDone ?? this.isDone,
selectedOrder: updateSelectedOrder ? selectedOrder : this.selectedOrder,      ordersStates: ordersStates ?? this.ordersStates,
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
