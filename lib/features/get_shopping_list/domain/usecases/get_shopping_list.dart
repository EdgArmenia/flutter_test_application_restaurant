import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/error/failures/failure.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/usecase.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/items_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/repositories/shopping_list_repository.dart';

// Класс сценарий получения списка элементов
class GetShoppingList extends UseCase<ItemsListEntity, NoParams> {
  final ShoppingListRepository _repository;

  GetShoppingList({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, ItemsListEntity>> call(NoParams params) async {
    return await _repository.getItems();
  }
}
