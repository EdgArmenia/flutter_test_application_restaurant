import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_products/domain/entities/dish_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dishes_list_entity.g.dart';

// Класс сущности список блюд
@JsonSerializable()
class DishesListEntity extends Equatable {
  final List<DishEntity?> dishes;

  const DishesListEntity({required this.dishes});

  factory DishesListEntity.fromJson(Map<String, dynamic> json) =>
      _$DishesListEntityFromJson(json);

  @override
  List<Object?> get props => [dishes];
}
