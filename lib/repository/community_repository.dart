import 'dart:io';

import 'package:http/http.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

abstract class BaseCommunityRepository {
  Future<CommunityRecipe> fetchCommunityRecipe();
  Future<CommunityRecipe?> fetchCommunityRecipeForFeed();
  Future<CommunityRecipeModel> fetchCommunityRecipeDetail(String recipe_id);
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

  @override
  Future<CommunityRecipeModel> fetchCommunityRecipeDetail(
      String recipe_id) async {
    final response = await _network.get(
      url: '/api/v1/community/recipe/' + recipe_id,
    ); //...,isLogin: true
    final data = [response];
    // return response;

    try {
      print("000000");
      print(response.values);
      print(CommunityRecipeModel.fromJson(response));
      print("10101010");
    } catch (e) {
      print(e);
    }
    return CommunityRecipeModel.fromJson(response);
  }
}
