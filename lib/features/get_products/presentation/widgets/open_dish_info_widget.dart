import 'package:flutter/material.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dish_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/widgets/dish_info_card_widget.dart';

// Метод реализующий открытие карточки блюда
Future<void> openDishInfoWidget(DishEntity dish, BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.pop(context, 'Cancel'),
        child: DishInfoCardWidget(dish: dish),
      );
    },
  );
}
