import 'package:json_annotation/json_annotation.dart';
part 'shopping_model.g.dart';


@JsonSerializable()
class ShoppingList {
  List<ShoppingModel> allShop;
  ShoppingList(this.allShop);
}

@JsonSerializable()
class ShoppingModel {
  int id;
  String gtin;
  String name;
  double needed_kg;

  ShoppingModel(
      {required this.id,
        required this.gtin,
        required this.name,
        required this.needed_kg});

  factory ShoppingModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingModelToJson(this);
}