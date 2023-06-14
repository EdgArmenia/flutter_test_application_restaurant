import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';

import '../../../../core/error/exceptions/server_exception.dart';
import '../../../../core/retrofit/retrofit_service.dart';

// Интерфейс удаленного источника данных
abstract interface class ProductsRemoteDataSource {
  Future<CategoriesListEntity> getCategories();
  Future<DishesListEntity> getDishes();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final RetrofitService _client;

  ProductsRemoteDataSourceImpl({required client}) : _client = client;

  // Реализация метода получения списка категорий с помощью retrofit
  @override
  Future<CategoriesListEntity> getCategories() async {
    return _getData<CategoriesListEntity>(() => _client.getCategories());
  }

  // Реализация метода получения списка блюд с помощью retrofit
  @override
  Future<DishesListEntity> getDishes() async {
    return _getData<DishesListEntity>(() => _client.getDishes());
  }

  // Метод шаблон, для получения данных из retrofit
  Future<T> _getData<T>(Future<T> Function() getItems) async {
    try {
      return await getItems();
    } catch (e) {
      throw ServerException();
    }
  }
}
