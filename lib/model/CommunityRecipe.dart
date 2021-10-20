import 'package:json_annotation/json_annotation.dart';
part 'CommunityRecipe.g.dart';

@JsonSerializable()
class CommunityRecipe {
  final List<CommunityRecipeModel> communityRecipes;
  CommunityRecipe(this.communityRecipes);
}

@JsonSerializable()
class CommunityRecipeModel {
  int id;
  String name;
  String photo_url;
  List<String> needed_ingredients;

  CommunityRecipeModel({
    required this.id,
    required this.name,
    required this.photo_url,
    required this.needed_ingredients
  });

  factory CommunityRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityRecipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityRecipeModelToJson(this);
}
