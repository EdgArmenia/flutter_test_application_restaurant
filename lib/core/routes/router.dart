// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter_test_application_restaurant/core/routes/router.gr.dart';

// Класс маршрутизатор для навигации экранов
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  // Геттер возрващающий дерево маршрутов
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: MainRouter.page,
              children: [
                AutoRoute(path: '', page: CategoriesRoute.page),
                AutoRoute(path: ':title', page: DishesRoute.page),
              ],
            ),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: ShoppingListRoute.page),
            AutoRoute(page: AccountRoute.page),
          ],
        ),
      ];
}
