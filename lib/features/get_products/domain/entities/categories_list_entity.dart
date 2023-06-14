import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_list_entity.g.dart';

// Класс сущность списка категорий
@JsonSerializable()
class CategoriesListEntity extends Equatable {
  @JsonKey(name: "сategories")
  final List<CategoryEntity> categories;

  const CategoriesListEntity({required this.categories});

  factory CategoriesListEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoriesListEntityFromJson(json);

  @override
  List<Object?> get props => [categories];
}
