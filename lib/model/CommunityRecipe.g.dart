// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommunityRecipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityRecipe _$CommunityRecipeFromJson(Map<String, dynamic> json) {
  return CommunityRecipe(
    (json['communityRecipes'] as List<dynamic>)
        .map((e) => CommunityRecipeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommunityRecipeToJson(CommunityRecipe instance) =>
    <String, dynamic>{
      'communityRecipes': instance.communityRecipes,
    };

CommunityRecipeModel _$CommunityRecipeModelFromJson(Map<String, dynamic> json) {
  return CommunityRecipeModel(
    id: json['id'] as int,
    name: json['name'] as String,
    photo_url: json['photo_url'] as String,
    needed_ingredients: (json['needed_ingredients'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$CommunityRecipeModelToJson(
        CommunityRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo_url': instance.photo_url,
      'needed_ingredients': instance.needed_ingredients,
    };
