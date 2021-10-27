// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mealplan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealPlanList _$MealPlanListFromJson(Map<String, dynamic> json) {
  return MealPlanList(
    (json['allMealPlan'] as List<dynamic>)
        .map((e) => MealPlanModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealPlanListToJson(MealPlanList instance) =>
    <String, dynamic>{
      'allMealPlan': instance.allMealPlan,
    };

MealPlanModel _$MealPlanModelFromJson(Map<String, dynamic> json) {
  return MealPlanModel(
    meal_plan_id: json['meal_plan_id'] as int,
    recipe_name: json['recipe_name'] as String,
    ingredients:
        (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
    steps: json['steps'] as String,
  );
}

Map<String, dynamic> _$MealPlanModelToJson(MealPlanModel instance) =>
    <String, dynamic>{
      'meal_plan_id': instance.meal_plan_id,
      'recipe_name': instance.recipe_name,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
    };
