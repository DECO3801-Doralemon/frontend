import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/community_repository.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class CommunityBloc {
  late CommunityRepository _communityRepository;
  final _CommunityRecipeForFeedController =
      StreamController<NetworkModel<CommunityRecipe>>();
  final NetworkInterface _network = NetworkInterface();
  final _CommunityRecipeController =
      StreamController<NetworkModel<CommunityRecipe>>();
  List<CommunityRecipeModel>? CommunityRecipefromApi;

  StreamSink<NetworkModel<CommunityRecipe>> get CommunityRecipeforFeedSink =>
      _CommunityRecipeForFeedController.sink;
  Stream<NetworkModel<CommunityRecipe>> get CommunityRecipeforFeedStreamm =>
      _CommunityRecipeForFeedController.stream;
  StreamSink<NetworkModel<CommunityRecipe>> get CommunityRecipeSink =>
      _CommunityRecipeController.sink;
  Stream<NetworkModel<CommunityRecipe>> get CommunityRecipeStream =>
      _CommunityRecipeController.stream;

  CommunityBloc() {
    _communityRepository = GetIt.instance.get<CommunityRepository>();
    //fetchUserDetail(email);
  }

  Future<void> fetchCommunityRecipeForFeed() async {
    CommunityRecipeforFeedSink.add(NetworkModel.loading('Getting user'));
    try {
      var response = await _communityRepository.fetchCommunityRecipeForFeed();
      print("1111");
      CommunityRecipefromApi = List.from(response!.communityRecipes);
      print("2222");
      CommunityRecipeforFeedSink.add(NetworkModel.completed(response));
      print("3333");
    } catch (e) {
      if (!_CommunityRecipeForFeedController.isClosed) {
        print("444");
        CommunityRecipeforFeedSink.add(NetworkModel.error(e.toString()));
        print(e);
        print("555");
      }
    }
  }

  Future<List<CommunityRecipeModel>?> fetchFeed() async {
    try {
      await fetchCommunityRecipeForFeed();
      print(CommunityRecipefromApi);
      return CommunityRecipefromApi!;
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchCommunityRecipe() async {
    CommunityRecipeSink.add(NetworkModel.loading('Getting Recipes...'));
    try {
      var response = await _communityRepository.fetchCommunityRecipe();
      CommunityRecipefromApi = List.from(response.communityRecipes);
      print(";;;;;;;;;;;;;;;;;;;;;;");
      print(response.communityRecipes);
      CommunityRecipeSink.add(NetworkModel.completed(response));
    } catch (e) {
      if (!_CommunityRecipeController.isClosed) {
        CommunityRecipeSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<List<CommunityRecipeModel>?> fetchPersonal() async {
    try {
      await fetchCommunityRecipe();
      print("MASUK FETCHPERSONAL");
      print(CommunityRecipefromApi);
      return CommunityRecipefromApi!;
    } catch (e) {
      return null;
    }
  }

  Future<Response> PostRecipe(String recipe_id) async {
    try {
      return await _communityRepository.postRecipetoCommunity(recipe_id);
    } catch (_) {
      return Response('Failed to post recipe', 400);
    }
  }

  Future<CommunityRecipeModel?> FetchRecipeDetail(String recipe_id) async {
    try {
      return await _communityRepository.fetchCommunityRecipeDetail(recipe_id);
    } catch (_) {
      // return Response('Failed to get recipe detail', 400);
      return null;
    }
  }

  void dispose() {
    _CommunityRecipeForFeedController.close();
    _CommunityRecipeController.close();
  }

}
