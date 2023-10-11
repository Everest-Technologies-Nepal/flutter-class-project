import 'package:authentication/views/auth_checker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenHandler {
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }

  void storeToken(token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<String?> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.remove("token");
    Get.off(() => const AuthChecker());
    return null;
  }
}
