import 'dart:async';
import 'package:pantry_saver_fe/model/shopping_model.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/repository/shopping_repository.dart';

class ShoppingBloc {
  late ShoppingRepository _shoppingRepository;
  final _shoppingController = StreamController<NetworkModel<ShoppingList>>.broadcast();
  StreamSink<NetworkModel<ShoppingList>> get shoppingSink => _shoppingController.sink;
  Stream<NetworkModel<ShoppingList>> get shoppingStream => _shoppingController.stream;

  List<ShoppingModel>? allShoppingFromApi;

  ShoppingBloc() {
    _shoppingRepository = ShoppingRepository();
    fetchShoppingList();
  }

  void fetchShoppingList() async{
    shoppingSink.add(NetworkModel.loading('Getting Shopping List'));
    try {
      var shoppingResponse = await _shoppingRepository.fetchShoppingList();
      allShoppingFromApi = List.from(shoppingResponse.allShop);
      print(shoppingResponse);
      shoppingSink.add(NetworkModel.completed(shoppingResponse));
    } catch (e) {
      shoppingSink.add(NetworkModel.error(e.toString()));
      print('$e');
    }
  }

  /*Future<List<ShoppingModel>?> fetchShopping() async {
    try {
      await fetchShoppingList();
      return allShoppingFromApi;
    }catch (e) {
      return null;
    }
  }*/
  void resetShoppingList() {
    shoppingSink.add(NetworkModel.completed(ShoppingList(allShoppingFromApi!)));
  }

  void dispose() {
    _shoppingController.close();
  }

}