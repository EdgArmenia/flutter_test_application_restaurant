// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesListEntity _$CategoriesListEntityFromJson(
        Map<String, dynamic> json) =>
    CategoriesListEntity(
      categories: (json['сategories'] as List<dynamic>)
          .map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesListEntityToJson(
        CategoriesListEntity instance) =>
    <String, dynamic>{
      'сategories': instance.categories,
    };
