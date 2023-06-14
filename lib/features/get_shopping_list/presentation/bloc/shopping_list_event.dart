import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object?> get props => [];
}

class ShoppingListLoadItemsEvent extends ShoppingListEvent {}

class ShoppingListUpdateItemEvent extends ShoppingListEvent {
  final ItemEntity item;

  const ShoppingListUpdateItemEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class ShoppingListDeleteItemEvent extends ShoppingListEvent {
  final int id;

  const ShoppingListDeleteItemEvent(this.id);

  @override
  List<Object?> get props => [id];
}
