// ignore_for_file: invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

// Класс сущности категория
@JsonSerializable()
class CategoryEntity extends Equatable {
  final int id;
  final String name;

  @JsonKey(name: "image_url")
  final String imageUrl;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  // Метод десериализации данных с помощью json serializable
  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  @override
  List<Object?> get props => [id, name, imageUrl];
}
