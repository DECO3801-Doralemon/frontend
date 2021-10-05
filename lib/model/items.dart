import 'package:json_annotation/json_annotation.dart';
part 'items.g.dart';

@JsonSerializable()
class Items {
  final List<ItemModel> item;
  Items(this.item);
}

@JsonSerializable()
class ItemModel {
  int id;
  String gtin;
  String name;
  int expiry_countdown_in_days;
  double kg;

  ItemModel({
    required this.id,
    required this.gtin,
    required this.name,
    required this.expiry_countdown_in_days,
    required this.kg,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
