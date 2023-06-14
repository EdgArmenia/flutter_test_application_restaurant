import 'package:flutter/material.dart';
import 'package:flutter_test_application_restaurant/core/platform/date_and_location_info.dart';
import 'package:flutter_test_application_restaurant/core/utils/date_and_location.dart';

// Класс провайдер для страницы CategoriesPage
class CategoriesProvider extends ChangeNotifier {
  final DateAndLocationInfo _dateAndLocationInfo;

  DateAndLocation? _dateAndLocation;

  CategoriesProvider(this._dateAndLocationInfo) {
    _initDateAndLocation();
  }

  // Геттер для получения объекта даты и места
  DateAndLocation? get dateAndLocation => _dateAndLocation;

  // Метод инициализирующий получения даты и места
  void _initDateAndLocation() async {
    _dateAndLocation = await _dateAndLocationInfo.getDateAndLocation();
    notifyListeners();
  }
}
