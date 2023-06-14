import 'package:flutter/material.dart';
import 'package:flutter_test_application_restaurant/common/colors/app_colors.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/providers/shopping_list_provider.dart';

class ShoppingListItemWidget extends StatelessWidget {
  const ShoppingListItemWidget(this._item, this._provider, {super.key});

  final ItemEntity _item;
  final ShoppingListProvider _provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.imageInCardColor,
                      image: DecorationImage(
                        image: NetworkImage(_item.imageUrl),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _item.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_item.price} ₽",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            " • ${_item.weight}г",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey.shade300,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () =>
                          _provider.updateList(_item, false, context),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 16.0,
                      )),
                  Text(
                    "${_item.itemCount}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _provider.updateList(_item, true, context),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
