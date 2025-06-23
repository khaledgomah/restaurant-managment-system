import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/core/use_case/use_case.dart';
import 'package:restaurant_system/features/online_order/data/models/online_order.dart';
import 'package:restaurant_system/features/online_order/domain/usecases/usecases.dart';

part 'online_order_state.dart';

class OnlineOrderCubit extends Cubit<OnlineOrderState> {
  final OnlineOrderUseCases _onlineOrderUseCases;

  OnlineOrderCubit({
    required OnlineOrderUseCases onlineOrderUseCases,
  })  : _onlineOrderUseCases = onlineOrderUseCases,
        super(OnlineOrderState(ordersStates: OrdersStates.loading));

  void getPendingOrders() async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));
    var pendingOrdersResult = await _onlineOrderUseCases.getPendingOrders.call(NoParams());

    pendingOrdersResult.fold(
        (failure) => emit(state.copyWith(
          ordersStates: OrdersStates.failure,
        )),
        (orders) => emit(
          state.copyWith(
            ordersStates: OrdersStates.success,
            pendingOrders: orders,
          ),
        ),
      );
  }

  void getCompletedOrders() async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));
    var completedOrdersResult =
        await _onlineOrderUseCases.getCompletedOrders.call(NoParams());
    completedOrdersResult.fold(
      (failure) => emit(state.copyWith(ordersStates: OrdersStates.failure)),
      (orders) => emit(
        state.copyWith(
          ordersStates: OrdersStates.success,
          completedOrders: orders,
        ),
      ),
    );
  }

  void completeOrder(String orderId) async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));
    var completeOrderResult =
        await _onlineOrderUseCases.completeOrder.call(orderId);
    completeOrderResult.fold(
      (failure) => emit(state.copyWith(ordersStates: OrdersStates.failure)),
      (_) {
        getPendingOrders();
        getCompletedOrders();
      },
    );
  }
}
