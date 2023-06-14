import 'package:flutter_test_application_restaurant/core/error/exceptions/cache_exception.dart';
import 'package:flutter_test_application_restaurant/core/local_database/local_database.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

// Интерфейс локального источника данных
abstract interface class ProductsLocalDataSource {
  Future<void> addToShoppingList(ItemEntity item);
}

// Класс реализация локального источника данных
class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final LocalDatabase _database;

  ProductsLocalDataSourceImpl({required database}) : _database = database;

  // Реализация метода добавления блюда в корзину (в локальную бд)
  @override
  Future<void> addToShoppingList(ItemEntity item) async {
    try {
      await _database.insertItem(item);
    } catch (e) {
      throw CacheException();
    }
  }
}
