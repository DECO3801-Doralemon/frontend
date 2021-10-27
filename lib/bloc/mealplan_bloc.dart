import 'dart:async';
import 'package:pantry_saver_fe/model/mealplan_model.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/mealplan_repository.dart';

class MealPlanBloc {
  late MealPlanRepository _mealPlanRepository;
  final _mealPlanController = StreamController<NetworkModel<MealPlanList>>.broadcast();
  StreamSink<NetworkModel<MealPlanList>> get mealPlanSink => _mealPlanController.sink;
  Stream<NetworkModel<MealPlanList>> get mealPlanStream => _mealPlanController.stream;

  List<MealPlanModel>? allMealPlanFromApi;

  MealPlanBloc() {
    _mealPlanRepository = MealPlanRepository();
    fetchMealPlanList();
  }

  void fetchMealPlanList() async{
    mealPlanSink.add(NetworkModel.loading('Getting Meal Plan List'));
    try {
      var mealPlanResponse = await _mealPlanRepository.fetchMealPlanList();
      allMealPlanFromApi = List.from(mealPlanResponse.allMealPlan);
      print(mealPlanResponse);
      mealPlanSink.add(NetworkModel.completed(mealPlanResponse));
    } catch (e) {
      mealPlanSink.add(NetworkModel.error(e.toString()));
      print('$e');
    }
  }

  void resetShoppingList() {
    mealPlanSink.add(NetworkModel.completed(MealPlanList(allMealPlanFromApi!)));
  }

  void dispose() {
    _mealPlanController.close();
  }

}