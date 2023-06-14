import 'package:equatable/equatable.dart';
import 'package:flutter_test_application_restaurant/features/get_shopping_list/domain/entities/item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items_list_entity.g.dart';

// Класс сущность списка элементов из корзины

@JsonSerializable()
class ItemsListEntity extends Equatable {
  final List<ItemEntity> items;

  const ItemsListEntity({required this.items});

  // Десериализация данных
  factory ItemsListEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemsListEntityFromJson(json);

  // Сериализация данных
  Map<String, dynamic> toJson() => _$ItemsListEntityToJson(this);

  @override
  List<Object?> get props => [items];
}
