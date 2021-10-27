import 'package:json_annotation/json_annotation.dart';
part 'mealplan_model.g.dart';

@JsonSerializable()
class MealPlanList {
  List<MealPlanModel> allMealPlan;
  MealPlanList(this.allMealPlan);
}

@JsonSerializable()
class MealPlanModel {
  int meal_plan_id;
  String recipe_name;
  List<String> ingredients;
  String steps;

  MealPlanModel({required this.meal_plan_id,
    required this.recipe_name,
    required this.ingredients,
    required this.steps});

  factory MealPlanModel.fromJson(Map<String, dynamic> json) =>
      _$MealPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlanModelToJson(this);
}