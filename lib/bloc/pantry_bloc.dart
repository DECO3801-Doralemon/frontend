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
import 'package:pantry_saver_fe/repository/pantry_repository.dart';
import 'package:pantry_saver_fe/repository/user_repository.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class PantryBloc {
  late PantryRepository _pantryRepository;
  final _pantryController = StreamController<NetworkModel<Items>>();
  final NetworkInterface _network = NetworkInterface();
  final _updateKgController = StreamController<NetworkModel<ItemModel>>();
  final _deleteController = StreamController<NetworkModel<dynamic>>();
  List<ItemModel>? pantryFromApi;

  StreamSink<NetworkModel<Items>> get pantrySink => _pantryController.sink;
  Stream<NetworkModel<Items>> get pantryStream => _pantryController.stream;
  StreamSink<NetworkModel<ItemModel>> get UpdateKgSink =>
      _updateKgController.sink;
  Stream<NetworkModel<ItemModel>> get UpdateKgStream =>
      _updateKgController.stream;
  StreamSink<NetworkModel<dynamic>> get deleteSink => _deleteController.sink;
  Stream<NetworkModel<dynamic>> get deleteStream => _deleteController.stream;

  PantryBloc() {
    _pantryRepository = GetIt.instance.get<PantryRepository>();
    //fetchUserDetail(email);
  }

  Future<void> fetchItemDetail() async {
    pantrySink.add(NetworkModel.loading('Getting user'));
    try {
      var pantryResponse = await _pantryRepository.fetchItemDetail();
      pantryFromApi = List.from(pantryResponse.item);
      print(pantryResponse);
      print(";;;;;;;;;;;;bloc");
      pantrySink.add(NetworkModel.completed(pantryResponse));
    } catch (e) {
      // throw Exception(e.toString());
      if (!_pantryController.isClosed) {
        pantrySink.add(NetworkModel.error(e.toString()));
      }
    }
  }

  Future<List<ItemModel>?> fetchItem() async {
    try {
      await fetchItemDetail();
      print("FROM BLOC*******");
      print(pantryFromApi);
      return pantryFromApi!;
    } catch (e) {
      return null;
    }
  }

  Future<void> UpdateKg(int id, double kg) async {
    UpdateKgSink.add(NetworkModel.loading('Update item model'));
    try {
      var updateResponse = await _pantryRepository.UpdateKg(id, kg);
      print(updateResponse);
      pantryFromApi = [updateResponse];
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
      return pantryFromApi;
    } catch (e) {
      return null;
    }
  }

  Future<void> delete(int id) async {
    deleteSink.add(NetworkModel.loading('Delete item model'));
    try {
      await _pantryRepository.deleteItem(id);
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
    _pantryController.close();
    _updateKgController.close();
    _deleteController.close();
  }
}
