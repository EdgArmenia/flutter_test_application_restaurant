// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/icons/app_icons.dart';
import 'package:flutter_test_application_restaurant/core/routes/router.gr.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_event.dart';

// Класс домашней страницы
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainRouter(),
        SearchRoute(),
        ShoppingListRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) =>
          _setBottomNavBar(context, tabsRouter),
    );
  }

  // Метод возвращающий нижнюю панель навигации
  BottomNavigationBar _setBottomNavBar(
      BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) => _onTap(context, tabsRouter, index),
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: AppIcons.unselectedMainIcon,
          activeIcon: AppIcons.selectedMainIcon,
          label: "Главная",
        ),
        BottomNavigationBarItem(
          icon: AppIcons.unselectedSearchIcon,
          activeIcon: AppIcons.selectedSearchIcon,
          label: "Поиск",
        ),
        BottomNavigationBarItem(
          icon: AppIcons.unselectedBagIcon,
          activeIcon: AppIcons.selectedBagIcon,
          label: "Корзина",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          label: "Аккаунт",
        ),
      ],
    );
  }

  // Метод реализации события при нажатии на раздел
  void _onTap(BuildContext context, TabsRouter tabsRouter, int index) {
    if (index == 2)
      context.read<ShoppingListBloc>().add(ShoppingListLoadItemsEvent());

    tabsRouter.setActiveIndex(index);
  }
}
