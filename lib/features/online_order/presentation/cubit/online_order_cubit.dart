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

  void changeSelectedOrder(OnlineOrder order) {
    emit(state.copyWith(
      updateSelectedOrder: true,
      selectedOrder: order,
      isDone: List.filled(order.order.length, false),
    ));
  }

  void updateIsDone(int index, bool value) {
    List<bool> isDone = state.isDone!;
    isDone[index] = value;
    emit(state.copyWith(isDone: isDone));
  }

  void getPendingOrders() async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));
    var pendingOrdersResult =
        await _onlineOrderUseCases.getPendingOrders.call(NoParams());

    pendingOrdersResult.fold(
      (failure) => emit(state.copyWith(
        ordersStates: OrdersStates.failure,
      )),
      (orders) {
        orders.sort(
          (a, b) => a.orderId.compareTo(b.orderId),
        );
        emit(
          state.copyWith(
            ordersStates: OrdersStates.success,
            pendingOrders: orders,
          ),
        );
      },
    );
  }

  void getCompletedOrders() async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));
    var completedOrdersResult =
        await _onlineOrderUseCases.getCompletedOrders.call(NoParams());
    completedOrdersResult.fold(
      (failure) => emit(state.copyWith(ordersStates: OrdersStates.failure)),
      (orders) {
        orders.sort(
          (a, b) => a.orderId.compareTo(b.orderId),
        );
        emit(
          state.copyWith(
            ordersStates: OrdersStates.success,
            completedOrders: orders,
          ),
        );
      },
    );
  }

  Future<void> completeOrder(int orderId) async {
    emit(state.copyWith(ordersStates: OrdersStates.loading));

    final result = await _onlineOrderUseCases.completeOrder(orderId);
    result.fold(
      (failure) => emit(state.copyWith(ordersStates: OrdersStates.failure)),
      (_) async {
        final results = await Future.wait([
          _onlineOrderUseCases.getPendingOrders(NoParams()),
          _onlineOrderUseCases.getCompletedOrders(NoParams()),
        ]);

        final pendingResult = results[0];
        final completedResult = results[1];

        List<OnlineOrder>? pending = state.pendingOrders;
        List<OnlineOrder>? completed = state.completedOrders;

        if (pendingResult.isRight()) {
          pending = pendingResult.getOrElse(() => []);
        }

        if (completedResult.isRight()) {
          completed = completedResult.getOrElse(() => []);
        }

        emit(state.copyWith(
          updateSelectedOrder: true,
          isDone: List.filled(pending?[0].order.length?? 0, false),
          selectedOrder:pending?[0],
          ordersStates: OrdersStates.success,
          pendingOrders: pending,
          completedOrders: completed,
        ));
      },
    );
  }
}
