import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';
import 'package:http/http.dart';

abstract class BasePantryRepository {
  Future<Items> fetchItemDetail();
}

class PantryRepository implements BasePantryRepository {
  final NetworkInterface _network = NetworkInterface();

  @override
  Future<Items> fetchItemDetail() async {
    final response = await _network.get(
      url: '/api/v1/storage/pantry',
    ); //...,isLogin: true
    final data = response.values.toList();
    print(data);

    print(Items(data.first
        .map<ItemModel>((item) => ItemModel.fromJson(item))
        .toList()));
    return Items(
        data.first.map<ItemModel>((item) => ItemModel.fromJson(item)).toList());
  }

  Future<ItemModel> UpdateKg(int id, double kg) async {
    var uri = Uri.parse('/api/v1/storage/pantry');
    final body = {
      'id': id,
      'kg': kg,
    };
    final response =
        await _network.put(url: '/api/v1/storage/pantry', bodyParams: body);
    final data = [response];
    print(response);
    var kontol = response.map<ItemModel>((item) => ItemModel.fromJson(item));
    final response2 = await _network.get(
      url: '/api/v1/storage/pantry',
    ); //...,isLogin: true
    final data2 = response2.values.toList();
    print(data2);

    return kontol;
  }

  Future<ItemModel?> deleteItem(int id) async {
    final body = {
      'id': id,
    };
    final response =
        await _network.delete(url: '/api/v1/storage/pantry', bodyParams: body);
    final data = [response];
    print(response);
    var kontol = response.map<ItemModel>((item) => ItemModel.fromJson(item));
    final response2 = await _network.get(
      url: '/api/v1/storage/pantry',
    ); //...,isLogin: true
    final data2 = response2.values.toList();
    print(data2);

    return null;
  }

  Future<void> addToPantry(String result) async{
    final body = {
      'data_matrix': result,
    };
    print(body);
    final response = await _network.post(url: '/api/v1/storage/pantry', bodyParams: body);
  }
}
