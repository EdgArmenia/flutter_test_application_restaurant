import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';

// Классы состояний экрана ShopingListPage

abstract class ShoppingListState extends Equatable {
  const ShoppingListState();

  @override
  List<Object?> get props => [];
}

class ShoppingListEmptyState extends ShoppingListState {}

class ShoppingListLoadingState extends ShoppingListState {}

class ShoppingListLoadedState extends ShoppingListState {
  final ItemsListEntity items;

  const ShoppingListLoadedState(this.items);

  @override
  List<Object?> get props => [items];
}

class ShoppingListErrorState extends ShoppingListState {
  final String message;

  const ShoppingListErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
