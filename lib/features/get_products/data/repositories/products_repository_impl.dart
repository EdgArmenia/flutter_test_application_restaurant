import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/exceptions/cache_exception.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/cache_failure.dart';
import 'package:flutter_test_application_restaurant/features/get_products/data/datasources/products_local_datasource.dart';
import 'package:flutter_test_application_restaurant/features/get_products/data/datasources/products_remote_datasource.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/repositories/products_repository.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

import '../../../../core/error/exceptions/server_exception.dart';
import '../../../../core/error/failures/failure.dart';
import '../../../../core/error/failures/internet_connection_failure.dart';
import '../../../../core/error/failures/server_failure.dart';
import '../../../../core/platform/network_info.dart';

// Класс реализующий products repository
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  final ProductsLocalDataSource _productsLocalDataSource;
  final NetworkInfo _networkInfo;

  ProductsRepositoryImpl({
    required productsRemoteDataSource,
    required productsLocalDataSource,
    required networkInfo,
  })  : _productsRemoteDataSource = productsRemoteDataSource,
        _productsLocalDataSource = productsLocalDataSource,
        _networkInfo = networkInfo;

  // Реализация метода получения списка категорий из удаленного источника данных
  @override
  Future<Either<Failure, CategoriesListEntity>> getCategories() async {
    return _getData<CategoriesListEntity>(
        () => _productsRemoteDataSource.getCategories());
  }

  // Реализация метода получения списка блюд из удаленного источника данных
  @override
  Future<Either<Failure, DishesListEntity>> getDishes() async {
    return _getData<DishesListEntity>(
        () => _productsRemoteDataSource.getDishes());
  }

  Future<Either<Failure, T>> _getData<T>(Future<T> Function() getItems) async {
    if (await _networkInfo.isConnected) {
      try {
        final items = await getItems();

        return Right(items);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  // Реализация метода добавления блюда в корзину
  @override
  Future<Either<Failure, void>> addToShoppingList(ItemEntity item) async {
    try {
      final response = await _productsLocalDataSource.addToShoppingList(item);

      return Right(response);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
