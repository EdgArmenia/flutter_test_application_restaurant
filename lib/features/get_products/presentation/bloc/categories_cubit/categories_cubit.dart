import 'package:flutter_test_application_restaurant/common/mapping/failure_to_message.dart';
import 'package:flutter_test_application_restaurant/core/usecases/params/no_params.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/get_categories.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Класс управления состояния экрана CategoriesPage с помощью Cubit
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategories _getCategories;

  CategoriesCubit({required getCategories})
      : _getCategories = getCategories,
        super(CategoriesEmptyState());

  // Метод загрузки категорий
  void loadCategories() async {
    if (state is CategoriesLoadingState) return;

    // Меняем состояние на загружающий
    emit(CategoriesLoadingState());

    // Получаем данные с usecase
    final failureOrCategories = await _getCategories(NoParams());

    // Обрабатываем результат
    failureOrCategories.fold(
      (failure) => emit(CategoriesErrorState(mapFailureToMessage(failure))),
      (categories) => emit(CategoriesLoadedState(categories)),
    );
  }
}
