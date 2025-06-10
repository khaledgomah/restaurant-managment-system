import 'package:equatable/equatable.dart';
import 'package:restaurant_system/core/data/models/item_model.dart';
import 'package:restaurant_system/core/errors/failure.dart';

abstract class NewOrderState extends Equatable {
  const NewOrderState(this.selected, this.selling);
  final int selected;
  final List<SellingItem> selling;

  NewOrderState copyWith({int? selected, List<SellingItem> selling});
  @override
  List<Object?> get props => [selected, selling];
}

class NewOrderInitial extends NewOrderState {
  const NewOrderInitial(super.selected, super.selling);

  @override
  NewOrderState copyWith({int? selected, List<SellingItem>? selling}) {
    return NewOrderInitial(
      selected ?? this.selected,
      selling ?? this.selling,
    );
  }
}

class NewOrderLoading extends NewOrderState {
  const NewOrderLoading(super.selected, super.selling);

  @override
  NewOrderState copyWith({int? selected, List<SellingItem>? selling}) {
    return NewOrderLoading(
      selected ?? this.selected,
      selling ?? this.selling,
    );
  }
}

class NewOrderFailure extends NewOrderState {
  const NewOrderFailure(super.selected, this.failure, super.selling);
  final Failure failure;
  @override
  NewOrderState copyWith({int? selected, List<SellingItem>? selling}) {
    return NewOrderFailure(
      selected ?? this.selected,
      failure,
      selling ?? this.selling,
    );
  }
}

class NewOrderSuccess extends NewOrderState {
  const NewOrderSuccess(super.selected, this.items, super.selling);
  final List<ItemModel> items;
  @override
  NewOrderState copyWith({int? selected, List<SellingItem>? selling}) {
    return NewOrderSuccess(
        selected ?? this.selected, items, selling ?? this.selling);
  }
}

class SellingItem {
  final ItemModel item;
  final int number;

  const SellingItem({required this.item, required this.number});

  SellingItem copyWith({int? number, ItemModel? item}) {
    return SellingItem(
      item: item ?? this.item,
      number: number ?? this.number,
    );
  }
}
