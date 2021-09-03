import 'package:get_it/get_it.dart';
import 'package:pantry_saver_fe/repository/login_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';

class AppGetIt {
  final _getIt = GetIt.instance;

  void initialize() {
    _getIt.registerLazySingleton<UserRepository>(() => UserRepository());
    _getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
  }
}
