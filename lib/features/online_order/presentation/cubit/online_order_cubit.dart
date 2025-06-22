import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'online_order_state.dart';

class OnlineOrderCubit extends Cubit<OnlineOrderState> {
  OnlineOrderCubit() : super(OnlineOrderInitial());
}
