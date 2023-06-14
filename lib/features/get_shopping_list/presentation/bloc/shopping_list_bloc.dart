import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/delete_item_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/update_item_params.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/delete_item.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/get_shopping_list.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/update_item.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_event.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_state.dart';

import '../../../../common/mapping/failure_to_message.dart';

// Класс управления состояния экрана ShoppingListPage с помощью BLoC
class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final GetShoppingList _getShoppingList;
  final UpdateItem _updateItem;
  final DeleteItem _deleteItem;

  ShoppingListBloc({
    required getShoppingList,
    required updateItem,
    required deleteItem,
  })  : _getShoppingList = getShoppingList,
        _updateItem = updateItem,
        _deleteItem = deleteItem,
        super(ShoppingListEmptyState()) {
    // Метод реагирующий на событие загрузки списка элементов
    on<ShoppingListLoadItemsEvent>(
      (event, emit) async {
        if (state is ShoppingListLoadingState) return;

        emit(ShoppingListLoadingState());

        final failureOrItems = await _getShoppingList(NoParams());

        failureOrItems.fold(
            (failure) =>
                emit(ShoppingListErrorState(mapFailureToMessage(failure))),
            (items) => emit(ShoppingListLoadedState(items)));
      },
    );
    // Метод реагирующий на событие обновления элемента
    on<ShoppingListUpdateItemEvent>(
      (event, emit) async {
        final failureOrUpdated =
            await _updateItem(UpdateItemParams(item: event.item));

        failureOrUpdated.fold(
          (failure) =>
              emit(ShoppingListErrorState(mapFailureToMessage(failure))),
          (updated) => null,
        );
      },
    );
    // Метод реагирующий на событие удаления элемента
    on<ShoppingListDeleteItemEvent>(
      (event, emit) async {
        final failureOrDeleted =
            await _deleteItem(DeleteItemParams(id: event.id));

        failureOrDeleted.fold(
          (failure) =>
              emit(ShoppingListErrorState(mapFailureToMessage(failure))),
          (deleted) => null,
        );
      },
    );
  }
}
