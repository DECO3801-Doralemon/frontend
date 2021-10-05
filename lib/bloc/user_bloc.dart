import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
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

  UserBloc() {
    _userRepository = GetIt.instance.get<UserRepository>();
    //fetchUserDetail(email);
  }

  Future<void> fetchUserDetail() async {
    userSink.add(NetworkModel.loading('Getting user'));
    try {
      var userResponse = await _userRepository.fetchUserDetail();
      userFromApi = List.from(userResponse.user);
      userSink.add(NetworkModel.completed(userResponse));
    } catch (e) {
      // throw Exception(e.toString());
      if (!_userController.isClosed) {
        userSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<UserModel?> fetchUser() async {
    try {
      await fetchUserDetail();
      return userFromApi!.first;
    } catch (e) {
      return null;
    }
  }

  Future<Response> registerNewUser(NewUser newUser) async {
    try {
      return await _userRepository.createUser(newUser);
    } catch (_) {
      return Response('Failed to register user', 400);
    }
  }

  void dispose() {
    _userController.close();
  }
}
