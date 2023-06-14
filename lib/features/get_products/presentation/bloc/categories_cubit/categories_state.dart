import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';

// Файл с состояниями экрана CategoriesPage

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesEmptyState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final CategoriesListEntity categories;

  const CategoriesLoadedState(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  const CategoriesErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
