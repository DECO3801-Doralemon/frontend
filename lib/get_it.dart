import 'package:pantry_saver_fe/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

class AppGetIt {
  final _getIt = GetIt.instance;

  void initialize() {
    _getIt.registerLazySingleton<BaseUserRepository>(() => UserRepository());
  }
}