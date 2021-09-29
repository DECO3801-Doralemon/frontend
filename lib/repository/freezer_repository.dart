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
    final data = response.values.toList();
    print(data);
    print("############################");

    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&");

    print("****************************");

    print(Items(data.first
        .map<ItemModel>((item) => ItemModel.fromJson(item))
        .toList()));

    print("@@@@@@@@@@@@@@@@@@@@");
    return Items(
        data.first.map<ItemModel>((item) => ItemModel.fromJson(item)).toList());
  }

  // Future<dynamic> UpdateKg(int id, double kg) async {
  //   final body = {
  //     'id': id,
  //     'kg': kg,
  //   };
  //   final response = await _network.put(
  //     url: '/api/v1/storage/freezer',
  //     bodyParams: body,
  //   );
  //   final data = [response];
  //   print(",,,,,,,");
  //   print(response);
  //   return response;
  // }

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
