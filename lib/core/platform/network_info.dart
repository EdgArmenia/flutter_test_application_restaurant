import 'package:internet_connection_checker/internet_connection_checker.dart';

// Абстрактный класс получения информации о интернете
abstract interface class NetworkInfo {
  Future<bool> get isConnected;
}

// Класс реализующий абстрактный класс получения информации о интернете
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl({required internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker;

  // Метод возвращающий значение, подключен ли телефон к интернету
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
