import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/core/routes/router.gr.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/category_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_event.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key, required category})
      : _category = category;

  final CategoryEntity _category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _navigateToDishesPage(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 165.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_category.imageUrl),
            ),
          ),
          child: SizedBox(
            width: 50.0,
            height: 20.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                _category.name,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDishesPage(BuildContext context) {
    final DishesBloc bloc = context.read<DishesBloc>();

    bloc.add(DishesLoadEvent());
    context.router.push(DishesRoute(title: _category.name));
  }
}
