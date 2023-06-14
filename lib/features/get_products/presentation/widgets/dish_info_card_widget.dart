import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/colors/app_colors.dart';
import 'package:flutter_test_application_restaurant/common/icons/app_icons.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dish_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_event.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';

class DishInfoCardWidget extends StatelessWidget {
  const DishInfoCardWidget({super.key, required dish}) : _dish = dish;

  final DishEntity _dish;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: 310,
                decoration: BoxDecoration(
                  color: AppColors.imageInCardColor,
                  image: DecorationImage(
                    image: NetworkImage(_dish.imageUrl),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 0.0,
                        child: IconButton(
                          onPressed: () {},
                          icon: AppIcons.favoriteIcon,
                        ),
                      ),
                      Card(
                        elevation: 0.0,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: AppIcons.cancelIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                _dish.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Text(
                    "${_dish.price} ₽",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    " • ${_dish.weight}г",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(
                _dish.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: AppColors.selectedButtonColor,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                ),
                onPressed: () => _addToShoppingList(context),
                child: const Text(
                  "Добавить в корзину",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _addToShoppingList(BuildContext context) {
    DishesBloc dishesBloc = context.read<DishesBloc>();

    dishesBloc.add(AddToShoppingListEvent(ItemEntity(
      null,
      name: _dish.name,
      price: _dish.price,
      weight: _dish.weight,
      imageUrl: _dish.imageUrl,
    )));
  }
}
