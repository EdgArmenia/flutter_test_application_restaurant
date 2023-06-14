import 'package:flutter_test_application_restaurant/core/utils/date_and_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Абстрактный класс, имеющий объявление метода получения даты и места
abstract interface class DateAndLocationInfo {
  Future<DateAndLocation> getDateAndLocation();
}

// Класс, реализующий абстрактный класс выше
class DateAndLocationInfoImpl implements DateAndLocationInfo {
  // Приватный метод получения локации телефона
  Future<String> _getLocation() async {
    final Position? position = await _getPosition();

    if (position != null) {
      final placemark = await placemarkFromCoordinates(
              position.latitude, position.longitude,
              localeIdentifier: 'ru_RUS')
          .then((places) => places[0]);
      return placemark.locality ?? "";
    }

    return "";
  }

  // Приватный метод получения даты
  String _getDate() {
    initializeDateFormatting('ru_RUS');
    DateTime time = DateTime.now();
    String date = DateFormat('dd MMMM, yyyy', 'ru_RUS').format(time);

    return date;
  }

  // Приватный метод получения координат
  Future<Position?> _getPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
  }

  // Метод проверяющий разрешение на предоставление данных gps
  Future<bool> _havePermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return true;
  }

  // Реализация метода получения объекта даты и места
  @override
  Future<DateAndLocation> getDateAndLocation() async {
    final date = _getDate();
    final location = await _getLocation();

    return DateAndLocation(date: date, location: location);
  }
}
