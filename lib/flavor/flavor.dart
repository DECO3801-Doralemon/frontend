import 'package:pantry_saver_fe/config/strings.dart';

enum BuildFlavor { production, development }

class ApiFlavor {
  //Can't be initialized but will be initialized before its referenced
  static late String flavor;

  static String getBaseUrl() {
    if (ApiFlavor.flavor == BuildFlavor.development.toString()) {
      return devBaseURL;
    } else {
      return baseURL;
    }
  }

}