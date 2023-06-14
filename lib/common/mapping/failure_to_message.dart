import '../../core/error/failures/failure.dart';
import '../../core/error/failures/server_failure.dart';
import '../constants.dart';

// Метод принимающий Failure объект и возвращающий ошибку типа String
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return Constants.SERVER_ERROR;
    default:
      return Constants.UNEXPECTED_ERROR;
  }
}
