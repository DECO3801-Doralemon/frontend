import 'package:pantry_saver_fe/config/strings.dart';

enum BuildFlavor { production, development }

class ApiFlavor {
  static String? flavor;

  static String getBaseUrl() {
    if (ApiFlavor.flavor == BuildFlavor.development.toString()) {
      return devBaseURL;
    } else {
      return baseURL;
    }
  }
}
