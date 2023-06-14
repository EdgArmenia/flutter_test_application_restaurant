import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

class AddToShoppingListParams extends Equatable {
  final ItemEntity item;

  const AddToShoppingListParams({required this.item});

  @override
  List<Object?> get props => [item];
}
