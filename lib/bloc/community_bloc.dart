import 'dart:async';

// import 'package:bisaGo/network/data/network_model.dart';
// import 'package:bisaGo/repository/user_repository.dart';
// import 'package:bisaGo/model/user.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/community_repository.dart';
import 'package:pantry_saver_fe/repository/freezer_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class CommunityBloc {
  late CommunityRepository _communityRepository;
  final _CommunityRecipeForFeedController = StreamController<NetworkModel<CommunityRecipe>>();
  final NetworkInterface _network = NetworkInterface();
  final _CommunityRecipeController = StreamController<NetworkModel<CommunityRecipe>>();
  List<CommunityRecipeModel>? CommunityRecipefromApi;

  StreamSink<NetworkModel<CommunityRecipe>> get CommunityRecipeforFeedSink => _CommunityRecipeForFeedController.sink;
  Stream<NetworkModel<CommunityRecipe>> get CommunityRecipeforFeedStreamm => _CommunityRecipeForFeedController.stream;
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
      CommunityRecipefromApi = List.from(response.communityRecipes);
      CommunityRecipeforFeedSink.add(NetworkModel.completed(response));
    } catch (e) {
      if (!_CommunityRecipeForFeedController.isClosed) {
        CommunityRecipeforFeedSink.add(NetworkModel.error(e.toString()));
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
      print(CommunityRecipefromApi);
      return CommunityRecipefromApi!;
    } catch (e) {
      return null;
    }
  }

  void dispose() {
    _CommunityRecipeForFeedController.close();
    _CommunityRecipeController.close();
  }
}