import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/di.dart';
import 'package:restaurant_system/features/checkout/data/repositories/repositories_impl.dart';
import 'package:restaurant_system/features/checkout/data/sources/sources.dart';
import 'package:restaurant_system/features/checkout/domain/usecases/usecases.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  var checkoutUseCase = CheckoutUseCase(instance<CheckoutRepositoryImp>());

  void createCheckoutSession(OrderRequest orderRequest) async {
    emit(CheckoutLoading());
    final result = await checkoutUseCase.call(orderRequest);
    result.fold(
      (failure) => emit(CheckoutFailure(failure.message)),
      (paymentKey) => emit(CheckoutSuccess(paymentKey)),
    );
  }
}
