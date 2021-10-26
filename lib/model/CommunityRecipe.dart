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
  String recipe_name;
  List<String> needed_ingredients;
  String photo_url;
  String? date_time_created;
  String? steps;

  CommunityRecipeModel({
    required this.id,
    required this.name,
    required this.recipe_name,
    required this.needed_ingredients,
    required this.photo_url,
    this.date_time_created,
    this.steps,
  });

  factory CommunityRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityRecipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityRecipeModelToJson(this);
}
