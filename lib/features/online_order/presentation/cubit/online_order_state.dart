part of 'online_order_cubit.dart';

class OnlineOrderState {
  final int? currentIndex;
  final OrdersStates ordersStates;
  final List<OnlineOrder>? pendingOrders;
  final List<OnlineOrder>? completedOrders;
  const OnlineOrderState({
    
    this.currentIndex,
    required this.ordersStates,
    this.pendingOrders,
    this.completedOrders,
  });

  OnlineOrderState copyWith({
    OrdersStates? ordersStates,
    List<OnlineOrder>? pendingOrders,
    List<OnlineOrder>? completedOrders,
    int? currentIndex = 0,
  }) {

    return OnlineOrderState(
      currentIndex: currentIndex ?? this.currentIndex,
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