import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';
import 'package:http/http.dart';

abstract class BaseCommunityRepository {
  Future<CommunityRecipe> fetchCommunityRecipe();
  Future<CommunityRecipe?> fetchCommunityRecipeForFeed();
  Future<Response> postRecipetoCommunity(String recipe_id);
// Future<Response> createUser(NewUser newUser);
// Future<Response> updateUser(NewUser newUser);
}

class CommunityRepository implements BaseCommunityRepository {
  final NetworkInterface _network = NetworkInterface();

  @override
  Future<Response> postRecipetoCommunity(String recipe_id) async {
    final body = {'recipe_id': recipe_id};
    final response =
        await _network.post(url: '/api/v1/recipe', bodyParams: body);
    return response;
  }

  @override
  Future<CommunityRecipe> fetchCommunityRecipe() async {
    print("testingupdatefetchitemdetailmasukga");
    final response = await _network.get(
      url: '/api/v1/recipes/all',
    ); //...,isLogin: true
    final data = response.values.toList();

    return CommunityRecipe(data[0]
        .map<CommunityRecipeModel>(
            (item) => CommunityRecipeModel.fromJson(item))
        .toList());
  }

  @override
  Future<CommunityRecipe?> fetchCommunityRecipeForFeed() async {
    print("testingupdatefetchitemdetailmasukgaforfeed");
    final response = await _network.get(
      url: '/api/v1/community',
    ); //...,isLogin: true
    final data = response.values.toList();
    print("*****");
    print(data);
    print(";;;;;");

    final testing = CommunityRecipe(data[0]
        .map<CommunityRecipeModel>(
            (item) => CommunityRecipeModel.fromJson(item))
        .toList());
    print(testing);

    return testing;
  }
}
