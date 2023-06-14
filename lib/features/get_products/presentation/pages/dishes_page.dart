// ignore_for_file: library_prefixes

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/widgets/loading_indicator_widget.dart';
import 'package:flutter_test_application_restaurant/core/utils/list_of_tegs.dart'
    as listOfTegs;
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_bloc.dart';
// import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_event.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_state.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/dishes_provider.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/widgets/dishes_page_appbar_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/dish_card_widget.dart';

// Страница блюд
@RoutePage()
class DishesPage extends StatelessWidget {
  const DishesPage({super.key, @PathParam() required title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    final DishesProvider provider = Provider.of<DishesProvider>(context);

    return Scaffold(
      appBar: dishesPageAppBarWidget(context, _title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10.0);
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: listOfTegs.tegs.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: provider.selectedColor[index],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => provider.addEvent(context, index),
                    child: Text(
                      listOfTegs.tegs[index],
                      style: TextStyle(
                        color: provider.setTextColor(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            BlocBuilder<DishesBloc, DishesState>(
              builder: (context, state) {
                late DishesListEntity dishesListEntity;

                if (state is DishesLoadingState) {
                  return loadingIndicatorWidget();
                } else if (state is DishesLoadedState) {
                  dishesListEntity = state.dishes;
                } else if (state is DishesErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: dishesListEntity.dishes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 180,
                        crossAxisSpacing: 3,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return DishCardWidget(
                            dish: dishesListEntity.dishes[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
