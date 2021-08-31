import 'dart:async';

// import 'package:bisaGo/network/data/network_model.dart';
// import 'package:bisaGo/repository/user_repository.dart';
// import 'package:bisaGo/model/user.dart';
import 'package:get_it/get_it.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';

class UserBloc {
  late UserRepository _userRepository;
  final _userController = StreamController<NetworkModel<User>>();
  List<UserModel>? userFromApi;

  StreamSink<NetworkModel<User>> get userSink => _userController.sink;
  Stream<NetworkModel<User>> get userStream => _userController.stream;

  UserBloc(String email) {
    _userRepository = GetIt.instance.get<UserRepository>();
    fetchUserDetail(email);
  }

  Future<void> fetchUserDetail(String email) async {
    userSink.add(NetworkModel.loading('Getting user'));
    try {
      var userResponse = await _userRepository.fetchUserDetail(email);
      userFromApi = List.from(userResponse.user);
      userSink.add(NetworkModel.completed(userResponse));
    } catch (e) {
      if (!_userController.isClosed) {
        userSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<UserModel?> fetchUser(String email) async {
    try {
      await fetchUserDetail(email);
      return userFromApi!.first;
    } catch (e) {
      return null;
    }
  }

  void dispose() {
    _userController.close();
  }
}
