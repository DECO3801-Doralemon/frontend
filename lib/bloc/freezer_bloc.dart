import 'dart:async';

// import 'package:bisaGo/network/data/network_model.dart';
// import 'package:bisaGo/repository/user_repository.dart';
// import 'package:bisaGo/model/user.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/freezer_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';

class FreezerBloc {
  late FreezerRepository _freezerRepository;
  final _freezerController = StreamController<NetworkModel<Items>>();
  List<ItemModel>? freezerFromApi;

  StreamSink<NetworkModel<Items>> get freezerSink => _freezerController.sink;
  Stream<NetworkModel<Items>> get freezerStream => _freezerController.stream;

  FreezerBloc() {
    _freezerRepository = GetIt.instance.get<FreezerRepository>();
    //fetchUserDetail(email);
  }

  Future<void> fetchItemDetail() async {
    freezerSink.add(NetworkModel.loading('Getting user'));
    try {
      var freezerResponse = await _freezerRepository.fetchItemDetail();
      freezerFromApi = List.from(freezerResponse.item);
      print(freezerResponse);
      print(";;;;;;;;;;;;bloc");
      freezerSink.add(NetworkModel.completed(freezerResponse));
    } catch (e) {
      // throw Exception(e.toString());
      if (!_freezerController.isClosed) {
        freezerSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<List<ItemModel>?> fetchItem() async {
    try {
      await fetchItemDetail();
      print("FROM BLOC*******");
      print(freezerFromApi);
      return freezerFromApi!;
    } catch (e) {
      return null;
    }
  }

  void dispose() {
    _freezerController.close();
  }
}
