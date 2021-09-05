import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

abstract class BaseUserRepository {
  Future<User> fetchUserDetail();
  Future<Response> createUser(NewUser newUser);
  Future<Response> updateUser(NewUser newUser);
}

class UserRepository implements BaseUserRepository {
  final NetworkInterface _network = NetworkInterface();

  @override
  Future<User> fetchUserDetail() async {
    final response = await _network.get(
      url: '/api/v1/profile/',
    ); //...,isLogin: true
    final data = [response];
    print(data);
    return User(
        data.map<UserModel>((user) => UserModel.fromJson(user)).toList());
  }

  @override
  Future<Response> createUser(NewUser newUser) async {
    final response = await _network.post(
        //'${ApiFlavor.getBaseUrl()}/api/register/',
        //body: newUser.toJson(),
        url: '/api/v1/auth/register',
        bodyParams: newUser.toJson());
    return response;
  }

  @override
  Future<Response> updateUser(NewUser newUser) async {
    final response = await _network.post(
      url: '${ApiFlavor.getBaseUrl()}/api/update-user/',
      bodyParams: newUser.toJson(),
    );
    return response;
  }
}
