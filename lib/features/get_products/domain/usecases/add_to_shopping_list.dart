import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/core/usecases/usecase.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/repositories/products_repository.dart';

import '../../../../core/usecases/params/add_to_shopping_list_params.dart';

// Класс сценария добавления элемента в корзину
class AddToShoppingList extends UseCase<void, AddToShoppingListParams> {
  final ProductsRepository _repository;

  AddToShoppingList({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await _repository.addToShoppingList(params.item);
  }
}
