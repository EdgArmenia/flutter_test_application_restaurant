import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';

// Файл с состояниями экрана DishesPage

abstract class DishesState extends Equatable {
  const DishesState();

  @override
  List<Object?> get props => [];
}

class DishesEmptyState extends DishesState {}

class DishesLoadingState extends DishesState {}

class DishesLoadedState extends DishesState {
  final DishesListEntity dishes;

  const DishesLoadedState(this.dishes);

  @override
  List<Object?> get props => [dishes];
}

class DishesErrorState extends DishesState {
  final String message;

  const DishesErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
