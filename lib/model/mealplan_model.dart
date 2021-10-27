


class MealPlanModel {
  int meal_plan_id;
  String recipe_name;
  List<String> ingredients;
  String steps;

  MealPlanModel({required this.meal_plan_id,
    required this.recipe_name,
    required this.ingredients,
    required this.steps});
}