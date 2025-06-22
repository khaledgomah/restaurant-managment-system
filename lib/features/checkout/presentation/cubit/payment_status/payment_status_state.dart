part of 'payment_status_cubit.dart';
enum PaymentStatus {
  success,
  pending,
  failed,
  loading
}
sealed class PaymentStatusState {
  const PaymentStatusState();
}

final class PaymentStatusInitial extends PaymentStatusState {}
final class PaymentStatusLoading extends PaymentStatusState {}
final class PaymentStatusSuccess extends PaymentStatusState {

}
final class PaymentStatusFailure extends PaymentStatusState {
  final String message;

  const PaymentStatusFailure(this.message);
}
final class PaymentStatusPending extends PaymentStatusState {

}