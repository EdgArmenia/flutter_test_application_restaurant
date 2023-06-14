import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_event.dart';

import '../../../../core/platform/date_and_location_info.dart';
import '../../../../core/utils/date_and_location.dart';

// Класс провайдер для страницы ShoppingListPage
class ShoppingListProvider extends ChangeNotifier {
  final DateAndLocationInfo _dateAndLocationInfo;

  DateAndLocation? _dateAndLocation;

  ShoppingListProvider({
    required dateAndLocationInfo,
  }) : _dateAndLocationInfo = dateAndLocationInfo {
    _initDateAndLocation();
  }

  // Геттер для получения объекта даты и места
  DateAndLocation? get dateAndLocation => _dateAndLocation;

  ItemsListEntity? _itemsList;
  int _totalPrice = 0;

  // Сеттер для списка элементов
  set itemsList(ItemsListEntity? items) {
    _itemsList = items;
  }

  // Сеттер для итоговой суммы
  set totalPrice(int price) {
    _totalPrice = price;
  }

  // Геттер для итоговой суммы
  int get totalPrice => _totalPrice;

  // Геттер для списка элементов
  ItemsListEntity? get itemsList => _itemsList;

  // Метод инициализирующий получения даты и места
  void _initDateAndLocation() async {
    _dateAndLocation = await _dateAndLocationInfo.getDateAndLocation();
    notifyListeners();
  }

  // Метод пересчитывающий итоговую сумму
  void countTotalPrice() {
    int totalPrice = 0;
    _itemsList?.items.forEach((item) {
      totalPrice += item.price * item.itemCount;
    });

    _totalPrice = totalPrice;
  }

  // Метод обновления списка
  void updateList(ItemEntity item, bool add, BuildContext context) {
    int index = _findItemInList(item);
    ShoppingListBloc bloc = context.read<ShoppingListBloc>();

    // Если была нажата кнопка добавить кол-во порций у элемента
    // то в позиции itemCount увеличивается значение
    // создается событие обновления элемента
    // и пересчитывается сумма
    if (add) {
      _itemsList?.items[index].itemCount++;
      bloc.add(ShoppingListUpdateItemEvent(_itemsList!.items[index]));
      countTotalPrice();
      // Иначе происходит происходит обновление но с уменьшением кол-ва
      // порций. Но перед изменением происходит проверка не одна ли порция
      // выбрана на данный момент. В таком случае происходит удаление элемента
    } else {
      if (item.itemCount == 1) {
        bloc.add(ShoppingListDeleteItemEvent(item.id ?? 0));
        _itemsList?.items.removeAt(index);
      } else {
        _itemsList?.items[index].itemCount--;
        bloc.add(ShoppingListUpdateItemEvent(_itemsList!.items[index]));
        countTotalPrice();
      }
    }

    notifyListeners();
  }

  // Метод возвращающий позицию элемента в списке
  int _findItemInList(ItemEntity item) {
    return _itemsList?.items.indexOf(item) ?? 0;
  }
}
