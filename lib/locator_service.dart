import 'package:dio/dio.dart';
import 'package:flutter_test_application_restaurant/common/constants.dart';
import 'package:flutter_test_application_restaurant/core/local_database/local_database.dart';
import 'package:flutter_test_application_restaurant/core/platform/date_and_location_info.dart';
import 'package:flutter_test_application_restaurant/core/retrofit/retrofit_service.dart';
import 'package:flutter_test_application_restaurant/features/get_products/data/datasources/products_remote_datasource.dart';
import 'package:flutter_test_application_restaurant/features/get_products/data/repositories/products_repository_impl.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/repositories/products_repository.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/add_to_shopping_list.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/get_categories.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/usecases/get_dishes.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/categories_provider.dart';
import 'package:flutter_test_application_restaurant/features/get_products/presentation/providers/dishes_provider.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/data/datasources/shopping_list_local_datasource.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/data/repositories/shopping_list_repository_impl.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/repositories/shopping_list_repository.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/delete_item.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/get_shopping_list.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/usecases/update_item.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/bloc/shopping_list_bloc.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/presentation/providers/shopping_list_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/core/platform/network_info.dart';
import 'features/get_products/data/datasources/products_local_datasource.dart';

/* 
  Реализация сервис локатора для инъекции зависимости.
  
*/

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => CategoriesCubit(getCategories: sl<GetCategories>()));
  sl.registerFactory(
    () => DishesBloc(
      getDishes: sl<GetDishes>(),
      addToShoppingList: sl<AddToShoppingList>(),
    ),
  );
  sl.registerFactory(
    () => ShoppingListBloc(
      getShoppingList: sl<GetShoppingList>(),
      updateItem: sl<UpdateItem>(),
      deleteItem: sl<DeleteItem>(),
    ),
  );

  // Provider
  sl.registerFactory(() => CategoriesProvider(sl<DateAndLocationInfo>()));
  sl.registerFactory(() => DishesProvider());
  sl.registerFactory(
    () => ShoppingListProvider(
      dateAndLocationInfo: sl<DateAndLocationInfo>(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(
      () => GetCategories(repository: sl<ProductsRepository>()));
  sl.registerLazySingleton(
      () => GetDishes(repository: sl<ProductsRepository>()));
  sl.registerLazySingleton(
      () => AddToShoppingList(repository: sl<ProductsRepository>()));
  sl.registerLazySingleton(
      () => GetShoppingList(repository: sl<ShoppingListRepository>()));
  sl.registerLazySingleton(
      () => UpdateItem(repository: sl<ShoppingListRepository>()));
  sl.registerLazySingleton(
      () => DeleteItem(repository: sl<ShoppingListRepository>()));

  // Repositories
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
      productsRemoteDataSource: sl<ProductsRemoteDataSource>(),
      productsLocalDataSource: sl<ProductsLocalDataSource>(),
      networkInfo: sl<NetworkInfo>()));
  sl.registerLazySingleton<ShoppingListRepository>(() =>
      ShoppingListRepositoryImpl(
          shoppingListLocalDataSource: sl<ShoppingListLocalDataSource>()));

  // DataSources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(client: sl<RetrofitService>()));
  sl.registerLazySingleton<ProductsLocalDataSource>(
      () => ProductsLocalDataSourceImpl(database: sl<LocalDatabase>()));
  sl.registerLazySingleton<ShoppingListLocalDataSource>(
      () => ShoppingListLocalDataSourceImpl(database: sl<LocalDatabase>()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      internetConnectionChecker: sl<InternetConnectionChecker>()));
  sl.registerLazySingleton<DateAndLocationInfo>(
      () => DateAndLocationInfoImpl());

  // External
  final Dio dio = Dio();
  dio.options.headers['Content-Type'] = "application/json";

  sl.registerLazySingleton<Dio>(() => dio);

  final RetrofitService client =
      RetrofitService(sl<Dio>(), baseUrl: Constants.BASE_URL);
  sl.registerLazySingleton<RetrofitService>(() => client);

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<LocalDatabase>(() => LocalDatabase());
}
