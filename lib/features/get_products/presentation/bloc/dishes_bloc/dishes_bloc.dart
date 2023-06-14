import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/add_to_shopping_list_params.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dish_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/add_to_shopping_list.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/get_dishes.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_event.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_state.dart';

import '../../../../../common/mapping/failure_to_message.dart';

// Класс управления состояния экрана DishesPage с помощью BLoC
class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final GetDishes _getDishes;
  final AddToShoppingList _addToShoppingList;

  DishesBloc({required getDishes, required addToShoppingList})
      : _getDishes = getDishes,
        _addToShoppingList = addToShoppingList,
        super(DishesEmptyState()) {
    // Метод реагирующий на событие загрузки списка блюд
    on<DishesLoadEvent>(
      (event, emit) async {
        if (state is DishesLoadingState) return;

        // Меняем состояние на загружающий
        emit(DishesLoadingState());

        final failureOrDishes = await _getDishes(NoParams());

        // Обрабатываем результат
        failureOrDishes.fold(
          (failure) => emit(DishesErrorState(mapFailureToMessage(failure))),
          (dishes) => emit(DishesLoadedState(dishes)),
        );
      },
    );

    // Метод реагирующий на событие загрузки списка блюд с определенным тегом
    on<DishesLoadWithTegEvent>(
      (event, emit) async {
        if (state is DishesLoadingState) return;

        emit(DishesLoadingState());

        final failureOrDishes = await _getDishes(NoParams());
        final List<DishEntity> sortedDishes = [];

        // Обрабатываем результат. Выбираются только те блюда, имеющий принадлежащий
        // опрделенному тегу
        failureOrDishes.fold(
            (failure) => emit(DishesErrorState(mapFailureToMessage(failure))),
            (dishes) {
          dishes.dishes.forEach((element) {
            if (element!.tegs.contains(event.teg)) {
              sortedDishes.add(element);
            }
          });

          emit(DishesLoadedState(DishesListEntity(dishes: sortedDishes)));
        });
      },
    );

    // Метод реагирующий на событие добавления элемента в корзину
    on<AddToShoppingListEvent>((event, emit) async {
      final failureOrSuccess =
          await _addToShoppingList(AddToShoppingListParams(item: event.item));
      failureOrSuccess.fold(
        (failure) => emit(DishesErrorState(mapFailureToMessage(failure))),
        (success) => null,
      );
    });
  }
}
