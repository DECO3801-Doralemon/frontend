import 'dart:convert';

import 'package:pantry_saver_fe/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
      imagePath:
          'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605',
      name: 'John Doe',
      followers: 423,
      likes: 290,
      waste_percentage: 40,
      email: 'doe.master99@gmail.com',
      about:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incids eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Semper auctor neque vitae tempu");

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
