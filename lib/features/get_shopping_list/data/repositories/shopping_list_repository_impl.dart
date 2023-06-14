import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/exceptions/cache_exception.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/cache_failure.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/data/datasources/shopping_list_local_datasource.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';

import '../../domain/repositories/shopping_list_repository.dart';

// Класс реализующий shopping lists repository
class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final ShoppingListLocalDataSource _shoppingListLocalDataSource;

  ShoppingListRepositoryImpl({required shoppingListLocalDataSource})
      : _shoppingListLocalDataSource = shoppingListLocalDataSource;

  // Реализация метода получения элементов из локального источника данных
  @override
  Future<Either<Failure, ItemsListEntity>> getItems() async {
    try {
      final items = await _shoppingListLocalDataSource.getItems();

      return Right(items);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  // Реализация метода обновления элемента в локальный источник данных
  @override
  Future<Either<Failure, void>> updateItem(ItemEntity item) async {
    try {
      final reposnse = await _shoppingListLocalDataSource.updateItem(item);

      return Right(reposnse);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  // Реализация метода удаления элемента в локальном источнике данных
  @override
  Future<Either<Failure, void>> deleteItem(int id) async {
    try {
      final response = await _shoppingListLocalDataSource.deleteItem(id);

      return Right(response);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
