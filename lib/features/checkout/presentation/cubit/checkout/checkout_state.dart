part of 'checkout_cubit.dart';

sealed class CheckoutState  {
  const CheckoutState();

}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {
  final GetPaymentKeyResponse paymentKeyResponse;

  const CheckoutSuccess(this.paymentKeyResponse);

}
class CheckoutFailure extends CheckoutState {
  final String message;

  const CheckoutFailure(this.message);
}
