import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String kAccessToken = 'ACCESS_TOKEN';

  final SharedPreferences preHelper;

  SharedPreferenceHelper({required this.preHelper});

  Future<void> setUserToken({required String token}) async {
    await preHelper.setString(kAccessToken, token);
  }

  Future<void> removeUserToken() async {
    await preHelper.remove(kAccessToken);
  }

  String? getUserToken() {
    final token = preHelper.getString(kAccessToken);
    return token;
  }
}
