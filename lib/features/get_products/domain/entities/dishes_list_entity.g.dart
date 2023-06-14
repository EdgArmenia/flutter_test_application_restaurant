// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishesListEntity _$DishesListEntityFromJson(Map<String, dynamic> json) =>
    DishesListEntity(
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) =>
              e == null ? null : DishEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishesListEntityToJson(DishesListEntity instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
    };
