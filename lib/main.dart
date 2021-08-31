import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

import 'app.dart';
import 'flavor/flavor.dart';
import 'get_it.dart';
import 'globalnetwork.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final _getIt = AppGetIt();
  _getIt.initialize();
  await DotEnv().load('.env');
  getDioInstance('build');
  await initializeDateFormatting('id_ID', null);
  Intl.defaultLocale = 'id_ID';
  dio.options.receiveTimeout = 15000;
  ApiFlavor.flavor = BuildFlavor.production.toString();

  // await UserPreferences.init();

  runApp(PantrySaver());
}
