

import 'package:pantry_saver_fe/model/shopping_model.dart';
import 'package:pantry_saver_fe/network/network_interface.dart';

class ShoppingRepository {
  final NetworkInterface _network = NetworkInterface();


  Future<ShoppingList> fetchShoppingList() async {
    final response = await _network.get(
      url: "/api/v1/shopping",
    );
    print(response);
    print(response['needed_ingredients']);
    return ShoppingList(
        response['needed_ingredients'].map<ShoppingModel>((shopping) => ShoppingModel.fromJson(shopping)).toList()
    );

  }

}

