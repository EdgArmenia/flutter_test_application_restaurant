import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/usecase.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/repositories/products_repository.dart';

// Класс сценария получения списка категорий
class GetCategories extends UseCase<CategoriesListEntity, NoParams> {
  final ProductsRepository _repository;

  GetCategories({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, CategoriesListEntity>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
