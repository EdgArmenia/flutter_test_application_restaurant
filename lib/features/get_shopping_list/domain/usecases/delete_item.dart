import 'package:dartz/dartz.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/delete_item_params.dart';

import '../../../../core/error/failures/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/shopping_list_repository.dart';

class DeleteItem extends UseCase<void, DeleteItemParams> {
  final ShoppingListRepository _repository;

  DeleteItem({required repository}) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(DeleteItemParams params) async {
    return await _repository.deleteItem(params.id);
  }
}
