import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

abstract class BaseFreezerRepository {
  Future<Items> fetchItemDetail();
  // Future<Response> createUser(NewUser newUser);
  // Future<Response> updateUser(NewUser newUser);
}

class FreezerRepository implements BaseFreezerRepository {
  final NetworkInterface _network = NetworkInterface();

  @override
  Future<Items> fetchItemDetail() async {
    final response = await _network.get(
      url: '/api/v1/storage/freezer',
    ); //...,isLogin: true
    final data = [response];
    print(data[0]["stored_ingredients"]);
    print("############################");
    print(Items(data[0]["stored_ingredients"]
        .map<ItemModel>((item) => ItemModel.fromJson(item))
        .toList()));
    return Items(data[0]["stored_ingredients"]
        .map<ItemModel>((item) => ItemModel.fromJson(item))
        .toList());
  }

  // @override
  // Future<Response> createUser(NewUser newUser) async {
  //   final response = await _network.post(
  //       //'${ApiFlavor.getBaseUrl()}/api/register/',
  //       //body: newUser.toJson(),
  //       url: '/api/v1/auth/register',
  //       bodyParams: newUser.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<Response> updateUser(NewUser newUser) async {
  //   final response = await _network.post(
  //     url: '${ApiFlavor.getBaseUrl()}/api/update-user/',
  //     bodyParams: newUser.toJson(),
  //   );
  //   return response;
  // }
}
