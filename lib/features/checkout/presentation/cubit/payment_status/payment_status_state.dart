part of 'payment_status_cubit.dart';
enum PaymentStatus {
  success,
  pending,

}
sealed class PaymentStatusState {
  const PaymentStatusState();
}

final class PaymentStatusInitial extends PaymentStatusState {}
final class PaymentStatusLoading extends PaymentStatusState {}
final class PaymentStatusSuccess extends PaymentStatusState {
  final PaymentStatus status;
  const PaymentStatusSuccess(this.status);
}
final class PaymentStatusFailure extends PaymentStatusState {
  final String message;

  const PaymentStatusFailure(this.message);
}
