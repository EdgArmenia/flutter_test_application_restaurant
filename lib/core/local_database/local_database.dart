import 'dart:io';

import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../../common/constants.dart';

// Класс локальной базы данных
// В качестве хранилища блюд, было принято решение использовать
// Локальный базу данных SQLite
class LocalDatabase {
  static late Database _database;

  // Геттер базы данных
  Future<Database> get database async {
    _database = await _initDB();

    return _database;
  }

  // Метод инициализирующий бд
  // создается путь где будет располагаться бд
  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}Shopping_list.db";

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  // Метод, создающий бд
  // создается таблица Shopping_list
  // которая имеет поля id, name, price, weight, image_url, item_count
  void _onCreateDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ${Constants.SHOPPING_LIST_TABLE}(${Constants.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT, ${Constants.COLUMN_NAME} TEXT, ${Constants.COLUMN_PRICE} INTEGER, ${Constants.COLUMN_WEIGHT} INTEGER, ${Constants.COLUMN_IMAGE_URL} TEXT, ${Constants.COLUMN_ITEM_COUNT} INTEGER)');
  }

  // GET
  // Метод, возвращающий список элементов корзины
  Future<ItemsListEntity> getItems() async {
    Database db = await database;
    final List<Map<String, dynamic>> itemsMapList =
        await db.query(Constants.SHOPPING_LIST_TABLE);
    final List<ItemEntity> itemsList = [];
    itemsMapList.forEach((itemMap) {
      itemsList.add(ItemEntity.fromJson(itemMap));
    });

    return ItemsListEntity(items: itemsList);
  }

  // INSERT
  // Метод для внесения данных
  Future<void> insertItem(ItemEntity item) async {
    Database db = await database;
    if (await _isNotAlreadyExist(item)) {
      await db.insert(Constants.SHOPPING_LIST_TABLE, item.toJson());
    } else {
      updateItem(item);
    }
  }

  // UPDATE
  // Метод для обновления данных
  Future<void> updateItem(ItemEntity item) async {
    Database db = await database;
    await db.update(
      Constants.SHOPPING_LIST_TABLE,
      item.toJson(),
      where: '${Constants.COLUMN_ID} = ?',
      whereArgs: [item.id],
    );
  }

  // DELETE
  // Метод для удаления данных
  Future<void> deleteItem(int? id) async {
    Database db = await database;
    await db.delete(
      Constants.SHOPPING_LIST_TABLE,
      where: '${Constants.COLUMN_ID} = ?',
      whereArgs: [id],
    );
  }

  // Приватный метод, проверяющий есть ли уже такой элемент в бд
  Future<bool> _isNotAlreadyExist(ItemEntity item) async {
    Database db = await database;

    final List<Map<String, dynamic>> itemsMapList = await db.query(
      Constants.SHOPPING_LIST_TABLE,
      where: '${Constants.COLUMN_NAME} = ?',
      whereArgs: [item.name],
    );
    final List<ItemEntity> itemsList = [];
    itemsMapList.forEach((itemMap) {
      itemsList.add(ItemEntity.fromJson(itemMap));
    });

    if (itemsList.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
