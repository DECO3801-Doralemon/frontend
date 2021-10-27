import 'package:get_it/get_it.dart';
import 'package:pantry_saver_fe/repository/community_repository.dart';
import 'package:pantry_saver_fe/repository/freezer_repository.dart';
import 'package:pantry_saver_fe/repository/fridge_repository.dart';
import 'package:pantry_saver_fe/repository/login_repository.dart';
import 'package:pantry_saver_fe/repository/mealplan_repository.dart';
import 'package:pantry_saver_fe/repository/pantry_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';

class AppGetIt {
  final _getIt = GetIt.instance;

  void initialize() {
    _getIt.registerLazySingleton<UserRepository>(() => UserRepository());
    _getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
    _getIt.registerLazySingleton<FreezerRepository>(() => FreezerRepository());
    _getIt.registerLazySingleton<CommunityRepository>(
        () => CommunityRepository());
    _getIt.registerLazySingleton<FridgeRepository>(() => FridgeRepository());
    _getIt.registerLazySingleton<PantryRepository>(() => PantryRepository());
    //_getIt.registerLazySingleton<MealPlanRepository>(() => MealPlanRepository());
  }
}
