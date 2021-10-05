import 'package:json_annotation/json_annotation.dart';
part 'shopping_model.g.dart';


@JsonSerializable()
class Shopping {
  final List<ShoppingModel> shop;
  Shopping(this.shop);
}

@JsonSerializable()
class ShoppingModel {
  int id;
  String gtin;
  String name;
  int neededKg;

  ShoppingModel(
      {required this.id,
        required this.gtin,
        required this.name,
        required this.neededKg});

  factory ShoppingModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingModelToJson(this);
}