import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_application_restaurant/common/colors/app_colors.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dish_entity.dart';

import 'open_dish_info_widget.dart';

class DishCardWidget extends StatelessWidget {
  const DishCardWidget({super.key, required dish}) : _dish = dish;

  final DishEntity _dish;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openDishInfoWidget(_dish, context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.imageInCardColor,
            ),
            child: Image.network(_dish.imageUrl),
          ),
          Text(
            _dish.name,
            style: Theme.of(context).textTheme.titleSmall,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
