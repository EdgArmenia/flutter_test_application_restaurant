// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsListEntity _$ItemsListEntityFromJson(Map<String, dynamic> json) =>
    ItemsListEntity(
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsListEntityToJson(ItemsListEntity instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
