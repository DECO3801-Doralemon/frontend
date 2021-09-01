import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/Welcome/welcome_screen.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

import 'flavor/flavor.dart';
import 'get_it.dart';
import 'globalnetwork.dart';

class PantrySaver extends StatelessWidget {
  // static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: orangePrimary,
          dividerColor: Colors.black,
          fontFamily: 'BalsamiqSans'),
      title: 'PantrySaver',
      home: Login(),
    );
  }
}
