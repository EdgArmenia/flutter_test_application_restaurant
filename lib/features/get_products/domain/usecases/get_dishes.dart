import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/usecase.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/repositories/products_repository.dart';

// Класс сценария получения списка блюд
class GetDishes extends UseCase<DishesListEntity, NoParams> {
  final ProductsRepository _repository;

  GetDishes({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, DishesListEntity>> call(NoParams params) async {
    return await _repository.getDishes();
  }
}
