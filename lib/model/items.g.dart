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
    gtin: json['gtin'] as String,
    name: json['name'] as String,
    expiry_countdown_in_days: json['expiry_countdown_in_days'] as int,
    kg: (json['kg'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'gtin': instance.gtin,
      'name': instance.name,
      'expiry_countdown_in_days': instance.expiry_countdown_in_days,
      'kg': instance.kg,
    };
