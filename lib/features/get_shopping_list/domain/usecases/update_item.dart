import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/update_item_params.dart';

import '../../../../core/error/failures/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/shopping_list_repository.dart';

// Класс сценарий обновления элемента
class UpdateItem extends UseCase<void, UpdateItemParams> {
  final ShoppingListRepository _repository;

  UpdateItem({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(UpdateItemParams params) async {
    return await _repository.updateItem(params.item);
  }
}
