

import 'package:pantry_saver_fe/model/shopping_model.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class ShoppingRepository {
  final NetworkInterface _network = NetworkInterface();


  Future<Shopping> fetchShoppingList() async {
    final response = await _network.get(
      url: "/api/v1/shopping",
    );
    return Shopping(
        response.map<ShoppingModel>((shopping) => ShoppingModel.fromJson(shopping)).toList()
    );

  }

}

