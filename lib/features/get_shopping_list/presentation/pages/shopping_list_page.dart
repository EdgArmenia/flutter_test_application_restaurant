// ignore_for_file: must_be_immutable, curly_braces_in_flow_control_structures

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/widgets/menu_appbar_widget.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_state.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors/app_colors.dart';
import '../../../../common/widgets/loading_indicator_widget.dart';
import '../widgets/shopping_list_item_widget.dart';

@RoutePage()
class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingListProvider provider =
        Provider.of<ShoppingListProvider>(context);
    return Scaffold(
      appBar: menuAppBarWidget(context, provider.dateAndLocation),
      body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          if (state is ShoppingListLoadingState) {
            return loadingIndicatorWidget();
          } else if (state is ShoppingListErrorState) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state is ShoppingListLoadedState) {
            provider.itemsList = state.items;
            provider.countTotalPrice();
          }

          if (provider.itemsList?.items.isEmpty ?? true) {
            return const Center(
              child: Text("Корзина пуста"),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.itemsList!.items.length,
                      itemBuilder: (context, index) {
                        return ShoppingListItemWidget(
                          provider.itemsList!.items[index],
                          provider,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: AppColors.selectedButtonColor,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Оплатить ${provider.totalPrice} ₽",
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
