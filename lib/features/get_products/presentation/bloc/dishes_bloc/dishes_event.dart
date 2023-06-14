import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

// Файл с событиями экрана DishesPage

abstract class DishesEvent extends Equatable {
  const DishesEvent();

  @override
  List<Object?> get props => [];
}

class DishesLoadEvent extends DishesEvent {}

class DishesLoadWithTegEvent extends DishesEvent {
  final String teg;

  const DishesLoadWithTegEvent(this.teg);

  @override
  List<Object?> get props => [teg];
}

class AddToShoppingListEvent extends DishesEvent {
  final ItemEntity item;

  const AddToShoppingListEvent(this.item);

  @override
  List<Object?> get props => [item];
}
