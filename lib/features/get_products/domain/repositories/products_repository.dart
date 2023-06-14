import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

abstract interface class ProductsRepository {
  Future<Either<Failure, CategoriesListEntity>> getCategories();
  Future<Either<Failure, DishesListEntity>> getDishes();
  Future<Either<Failure, void>> addToShoppingList(ItemEntity item);
}
