import 'dart:async';

// import 'package:bisaGo/model/new_user.dart';
// import 'package:bisaGo/network/data/network_model.dart';
// import 'package:bisaGo/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';

class NewUserBloc {
  // UserRepository _userRepository;
  // StreamController _userController;
  late UserRepository _userRepository;
  final _userController = StreamController<NetworkModel<User>>();

  NewUserBloc() {
    _userRepository = GetIt.instance.get<UserRepository>();
  }

  Future<Response> registerNewUser(NewUser newUser) async {
    try {
      return await _userRepository.createUser(newUser);
    } catch (_) {
      return Response('Failed to register user', 400);
    }
  }

  Future<Response> updateUser(NewUser newUser) async {
    try {
      return await _userRepository.updateUser(newUser);
    } catch (_) {
      return Response('Failed to update user', 400);
    }
  }

  void dispose() {
    _userController.close();
  }
}
