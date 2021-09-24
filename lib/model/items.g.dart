// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    (json['item'] as List<dynamic>)
        .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return ItemModel(
    id: json['id'] as int,
    name: json['name'] as String,
    weight: json['weight'] as int,
    expiry_date: DateTime.parse(json['expiry_date'] as String),
  );
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'expiry_date': instance.expiry_date.toIso8601String(),
    };
