import 'dart:async';

// import 'package:bisaGo/network/data/network_model.dart';
// import 'package:bisaGo/repository/user_repository.dart';
// import 'package:bisaGo/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pantry_saver_fe/model/login_model.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/login_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  late LoginRepository _loginRepository;
  final _loginController = StreamController<NetworkModel<Login>>();
  StreamSink<NetworkModel<Login>> get loginSink => _loginController.sink;
  Stream<NetworkModel<Login>> get loginStream => _loginController.stream;

  LoginBloc() {
    _loginRepository = GetIt.instance.get<LoginRepository>();
  }

  void dispose() {
    _loginController.close();
  }

  Future<Login?> loginUser(String username, String password) async {
    loginSink.add(NetworkModel.loading('loading'));
    try {
      var loginResponse = await _loginRepository.loginUser(username, password);
      loginSink.add(NetworkModel.completed(loginResponse));
      print(loginResponse); //for testing
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', loginResponse.login[0].access);
      sharedPreferences.setString('refresh', loginResponse.login[0].refresh);
      print(sharedPreferences.get('token'));
      print(sharedPreferences.get('refresh'));
      return loginResponse;
    } catch (e) {
      if (!_loginController.isClosed) {
        loginSink.add(NetworkModel.error(e.toString()));
        print(e.toString());

        return null;
      }
      print(
          "###############################################################################");
    }
  }
}
