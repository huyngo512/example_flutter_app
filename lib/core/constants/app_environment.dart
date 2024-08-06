import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String get envFileName =>
      checkEnv() ? '.env.development' : '.env.production';

  static String get apiIsUrl => dotenv.env['API_IS_URL'] ?? '';

  static bool checkEnv() {
    // check app in env dev or prod
    return true;
  }
}
