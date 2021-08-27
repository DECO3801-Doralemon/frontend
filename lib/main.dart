import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: orangePrimary,
          dividerColor: Colors.black,
          fontFamily: 'BalsamiqSans'),
      title: title,
      home: ProfilePage(),
    );
  }
}
