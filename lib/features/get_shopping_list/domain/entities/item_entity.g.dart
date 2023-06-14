// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) => ItemEntity(
      json['id'] as int?,
      name: json['name'] as String,
      price: json['price'] as int,
      weight: json['weight'] as int,
      imageUrl: json['image_url'] as String,
    )..itemCount = json['item_count'] as int;

Map<String, dynamic> _$ItemEntityToJson(ItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'image_url': instance.imageUrl,
      'item_count': instance.itemCount,
    };
