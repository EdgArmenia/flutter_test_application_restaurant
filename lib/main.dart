import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application_restaurant/common/theme/app_theme_data.dart';
import 'package:flutter_test_application_restaurant/core/routes/router.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/categories_provider.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/dishes_provider.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_event.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';
import 'locator_service.dart' as dependencyInjection;

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
            create: (context) => sl<CategoriesCubit>()..loadCategories()),
        BlocProvider<DishesBloc>(create: (context) => sl<DishesBloc>()),
        ChangeNotifierProvider(create: (context) => sl<CategoriesProvider>()),
        ChangeNotifierProvider<DishesProvider>.value(
            value: sl<DishesProvider>()),
        ChangeNotifierProvider(create: (context) => sl<ShoppingListProvider>()),
        BlocProvider(
          create: (context) => sl<ShoppingListBloc>()
            ..add(
              ShoppingListLoadItemsEvent(),
            ),
        ),
      ],
      child: MaterialApp.router(
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        title: "Restaurant app",
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
