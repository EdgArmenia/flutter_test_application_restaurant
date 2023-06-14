import 'package:dio/dio.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/categories_list_entity.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dishes_list_entity.dart';
import 'package:retrofit/http.dart';

import '../../common/constants.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  @GET("v3/058729bd-1402-4578-88de-265481fd7d54")
  Future<CategoriesListEntity> getCategories();

  @GET("v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
  Future<DishesListEntity> getDishes();
}
