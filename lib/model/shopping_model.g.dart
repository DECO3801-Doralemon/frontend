// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shopping _$ShoppingFromJson(Map<String, dynamic> json) {
  return Shopping(
    (json['shop'] as List<dynamic>)
        .map((e) => ShoppingModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShoppingToJson(Shopping instance) => <String, dynamic>{
      'shop': instance.shop,
    };

ShoppingModel _$ShoppingModelFromJson(Map<String, dynamic> json) {
  return ShoppingModel(
    id: json['id'] as int,
    gtin: json['gtin'] as String,
    name: json['name'] as String,
    neededKg: json['neededKg'] as int,
  );
}

Map<String, dynamic> _$ShoppingModelToJson(ShoppingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gtin': instance.gtin,
      'name': instance.name,
      'neededKg': instance.neededKg,
    };
