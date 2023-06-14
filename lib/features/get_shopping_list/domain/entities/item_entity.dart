// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_entity.g.dart';

// Класс сущность элемента из корзины

@JsonSerializable()
class ItemEntity extends Equatable {
  int? id;
  final String name;
  final int price;
  final int weight;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'item_count')
  int itemCount = 1;

  ItemEntity(
    this.id, {
    required this.name,
    required this.price,
    required this.weight,
    required this.imageUrl,
  });

  // Десериализация данных
  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);

  // Сериализация данных
  Map<String, dynamic> toJson() => _$ItemEntityToJson(this);

  @override
  List<Object?> get props => [id, name, price, weight, imageUrl, itemCount];
}
