// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_test_application_restaurant/features/get_products/presentation/pages/categories_page.dart'
    as _i1;
import 'package:flutter_test_application_restaurant/features/get_products/presentation/pages/dishes_page.dart'
    as _i2;
import 'package:flutter_test_application_restaurant/features/get_products/presentation/pages/main_pages_holder.dart'
    as _i3;
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/pages/shopping_list_page.dart'
    as _i4;
import 'package:flutter_test_application_restaurant/features/others/pages/account_page.dart'
    as _i5;
import 'package:flutter_test_application_restaurant/features/others/pages/search_page.dart'
    as _i6;
import 'package:flutter_test_application_restaurant/home_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CategoriesRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CategoriesPage(),
      );
    },
    DishesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DishesRouteArgs>(
          orElse: () => DishesRouteArgs(title: pathParams.get('title')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DishesPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    MainRouter.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MainPagesHolder(),
      );
    },
    ShoppingListRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ShoppingListPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AccountPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i8.PageRouteInfo<void> {
  const CategoriesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DishesPage]
class DishesRoute extends _i8.PageRouteInfo<DishesRouteArgs> {
  DishesRoute({
    _i9.Key? key,
    required dynamic title,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DishesRoute.name,
          args: DishesRouteArgs(
            key: key,
            title: title,
          ),
          rawPathParams: {'title': title},
          initialChildren: children,
        );

  static const String name = 'DishesRoute';

  static const _i8.PageInfo<DishesRouteArgs> page =
      _i8.PageInfo<DishesRouteArgs>(name);
}

class DishesRouteArgs {
  const DishesRouteArgs({
    this.key,
    required this.title,
  });

  final _i9.Key? key;

  final dynamic title;

  @override
  String toString() {
    return 'DishesRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.MainPagesHolder]
class MainRouter extends _i8.PageRouteInfo<void> {
  const MainRouter({List<_i8.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ShoppingListPage]
class ShoppingListRoute extends _i8.PageRouteInfo<void> {
  const ShoppingListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ShoppingListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingListRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
