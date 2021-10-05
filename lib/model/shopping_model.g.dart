// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) {
  return ShoppingList(
    (json['allShop'] as List<dynamic>)
        .map((e) => ShoppingModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'allShop': instance.allShop,
    };

ShoppingModel _$ShoppingModelFromJson(Map<String, dynamic> json) {
  return ShoppingModel(
    id: json['id'] as int,
    gtin: json['gtin'] as String,
    name: json['name'] as String,
    needed_kg: (json['needed_kg'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ShoppingModelToJson(ShoppingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gtin': instance.gtin,
      'name': instance.name,
      'needed_kg': instance.needed_kg,
    };
