

import 'package:pantry_saver_fe/model/mealplan_model.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class MealPlanRepository {
  final NetworkInterface _network = NetworkInterface();


  Future<MealPlanList> fetchMealPlanList() async {
    String today = DateTime.now().toIso8601String().substring(0,10).replaceAll("-", "/");
    final response = await _network.get(
      url: "/api/v1/meal-planner/$today",
    );
    print(response);
    return MealPlanList(
        response['meal_plans'].map<MealPlanModel>((mealPlan) => MealPlanModel.fromJson(mealPlan)).toList()
    );

  }

}

