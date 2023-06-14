import 'package:flutter_test_application_restaurant/core/error/exceptions/cache_exception.dart';
import 'package:flutter_test_application_restaurant/core/local_database/local_database.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';

// Интерфейс локального источника данных
abstract interface class ShoppingListLocalDataSource {
  Future<ItemsListEntity> getItems();
  Future<void> updateItem(ItemEntity item);
  Future<void> deleteItem(int id);
}

// Класс реализация локального источника данных
class ShoppingListLocalDataSourceImpl implements ShoppingListLocalDataSource {
  final LocalDatabase _database;

  ShoppingListLocalDataSourceImpl({required database}) : _database = database;

  // Реализация метода получения элементов из бд
  @override
  Future<ItemsListEntity> getItems() async {
    try {
      return await _database.getItems();
    } catch (e) {
      throw CacheException();
    }
  }

  // Реализация метода обновления элемента в бд
  @override
  Future<void> updateItem(ItemEntity item) async {
    try {
      await _database.updateItem(item);
    } catch (e) {
      throw CacheException();
    }
  }

  // Реализация метода удаления элемента из бд
  @override
  Future<void> deleteItem(int id) async {
    try {
      await _database.deleteItem(id);
    } catch (e) {
      throw CacheException();
    }
  }
}
