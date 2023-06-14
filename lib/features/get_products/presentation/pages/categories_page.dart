import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/widgets/loading_indicator_widget.dart';
import 'package:flutter_test_application_restaurant/common/widgets/menu_appbar_widget.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/categories_cubit/categories_state.dart';
// import 'package:flutter_test_application_restaurant/core/utils/date_and_location.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/category_card_widget.dart';

// Страница категорий
@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesProvider provider =
        Provider.of<CategoriesProvider>(context);

    return Scaffold(
      appBar: menuAppBarWidget(context, provider.dateAndLocation),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          late CategoriesListEntity categoriesList;

          if (state is CategoriesLoadingState) {
            return loadingIndicatorWidget();
          } else if (state is CategoriesLoadedState) {
            categoriesList = state.categories;
          } else if (state is CategoriesErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return SizedBox(
            child: Center(
              child: ListView.builder(
                itemCount: categoriesList.categories.length,
                itemBuilder: (context, index) {
                  return CategoryCardWidget(
                      category: categoriesList.categories[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
