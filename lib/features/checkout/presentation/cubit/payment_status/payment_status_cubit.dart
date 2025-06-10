import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_system/config/di.dart';
import 'package:restaurant_system/core/use_case/use_case.dart';
import 'package:restaurant_system/features/checkout/data/repositories/repositories_impl.dart';
import 'package:restaurant_system/features/checkout/domain/usecases/usecases.dart';

part 'payment_status_state.dart';

class PaymentStatusCubit extends Cubit<PaymentStatusState> {
  PaymentStatusCubit() : super(PaymentStatusInitial());
  void checkPaymentStatus() async {
    emit(PaymentStatusLoading());
    try {
      GetPaymentStatusUseCase paymentStatusUseCase =
          GetPaymentStatusUseCase(instance<CheckoutRepositoryImp>());
      final result = await paymentStatusUseCase.call(NoParams());
      result.fold((failure) => emit(PaymentStatusFailure(failure.message)),
          (paymentStatus) {
        switch (paymentStatus) {
          case PaymentStatus.success:
            emit(PaymentStatusSuccess(PaymentStatus.success));
            break;
          case PaymentStatus.pending:
            emit(PaymentStatusSuccess(PaymentStatus.pending));
            break;
         
        }
      });
    } catch (e) {
      emit(PaymentStatusFailure('Failed to check payment status: $e'));
    }
  }
}
