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
import 'package:pantry_saver_fe/repository/fridge_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class FridgeBloc {
  late FridgeRepository _fridgeRepository;
  final _fridgeController = StreamController<NetworkModel<Items>>();
  final NetworkInterface _network = NetworkInterface();
  final _updateKgController = StreamController<NetworkModel<ItemModel>>();
  final _deleteController = StreamController<NetworkModel<dynamic>>();
  List<ItemModel>? fridgeFromApi;

  StreamSink<NetworkModel<Items>> get fridgeSink => _fridgeController.sink;
  Stream<NetworkModel<Items>> get fridgeStream => _fridgeController.stream;
  StreamSink<NetworkModel<ItemModel>> get UpdateKgSink =>
      _updateKgController.sink;
  Stream<NetworkModel<ItemModel>> get UpdateKgStream =>
      _updateKgController.stream;
  StreamSink<NetworkModel<dynamic>> get deleteSink => _deleteController.sink;
  Stream<NetworkModel<dynamic>> get deleteStream => _deleteController.stream;

  FridgeBloc() {
    _fridgeRepository = GetIt.instance.get<FridgeRepository>();
    //fetchUserDetail(email);
  }

  Future<void> fetchItemDetail() async {
    fridgeSink.add(NetworkModel.loading('Getting user'));
    try {
      var fridgeResponse = await _fridgeRepository.fetchItemDetail();
      fridgeFromApi = List.from(fridgeResponse.item);
      print(fridgeResponse);
      print(";;;;;;;;;;;;bloc");
      fridgeSink.add(NetworkModel.completed(fridgeResponse));
    } catch (e) {
      // throw Exception(e.toString());
      if (!_fridgeController.isClosed) {
        fridgeSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<List<ItemModel>?> fetchItem() async {
    try {
      await fetchItemDetail();
      print("FROM BLOC*******");
      print(fridgeFromApi);
      return fridgeFromApi!;
    } catch (e) {
      return null;
    }
  }

  Future<void> UpdateKg(int id, double kg) async {
    UpdateKgSink.add(NetworkModel.loading('Update item model'));
    try {
      var updateResponse = await _fridgeRepository.UpdateKg(id, kg);
      print(updateResponse);
      fridgeFromApi = [updateResponse];
      UpdateKgSink.add(NetworkModel.completed(updateResponse));
    } catch (e) {
      if (!_updateKgController.isClosed) {
        UpdateKgSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<List<ItemModel>?> updateKgReturnModel(int id, double kg) async {
    try {
      await UpdateKg(id, kg);
      return fridgeFromApi;
    } catch (e) {
      return null;
    }
  }

  Future<void> delete(int id) async {
    deleteSink.add(NetworkModel.loading('Delete item model'));
    try {
      await _fridgeRepository.deleteItem(id);
      deleteSink.add(NetworkModel.completed('Successfully delete item model'));
    } catch (e) {
      if (!_deleteController.isClosed) {
        deleteSink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<String?> deleteItem(int id) async {
    try {
      await delete(id);
      return 'Successfully delete item model';
    } catch (e) {
      return 'Failed to delete item model';
    }
  }

  void dispose() {
    _fridgeController.close();
    _updateKgController.close();
    _deleteController.close();
  }
}
