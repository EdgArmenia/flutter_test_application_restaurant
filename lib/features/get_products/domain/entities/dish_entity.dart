// ignore_for_file: invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish_entity.g.dart';

// Класс сущности блюдо
@JsonSerializable()
class DishEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;

  @JsonKey(name: "image_url")
  final String imageUrl;

  final List<String> tegs;

  const DishEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tegs,
  });

  // Метод десериализации данных с помощью json serializable
  factory DishEntity.fromJson(Map<String, dynamic> json) =>
      _$DishEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DishEntityToJson(this);

  @override
  List<Object?> get props =>
      [id, name, price, weight, description, imageUrl, tegs];
}
