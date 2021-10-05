import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app.dart';
import 'flavor/flavor.dart';
import 'get_it.dart';
import 'globalnetwork.dart';

Future main() async {
  final _getIt = AppGetIt();
  _getIt.initialize();
  //await DotEnv().load(fileName: '.env');
  getDioInstance('build');
  await initializeDateFormatting('id_ID', null);
  Intl.defaultLocale = 'id_ID';
  dio.options.receiveTimeout = 15000;
  ApiFlavor.flavor = BuildFlavor.production.toString();

  // await UserPreferences.init();

  runApp(PantrySaver());
}



