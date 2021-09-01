import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';
import 'package:pantry_saver_fe/model/login_model.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

abstract class BaseLoginUserRepository {
  Future<Login> loginUser(String username, String password);
}

class LoginRepository implements BaseLoginUserRepository {
  final NetworkInterface _network = NetworkInterface();

  @override
  Future<Login> loginUser(String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };
    final response = await _network.post(
      url: '/api/token/',
      bodyParams: body,
    ); //...,isLogin: true
    final data = [response];
    print(response);
    return Login(
        data.map<LoginModel>((login) => LoginModel.fromJson(login)).toList());
  }
}
