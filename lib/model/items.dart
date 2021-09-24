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
  String name;
  int weight;
  DateTime expiry_date;

  ItemModel(
      {required this.id,
      required this.name,
      required this.weight,
      required this.expiry_date});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
