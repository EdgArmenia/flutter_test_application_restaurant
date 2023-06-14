import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';

abstract interface class ShoppingListRepository {
  Future<Either<Failure, ItemsListEntity>> getItems();
  Future<Either<Failure, void>> updateItem(ItemEntity item);
  Future<Either<Failure, void>> deleteItem(int id);
}
