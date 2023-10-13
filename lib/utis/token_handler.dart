import 'package:authentication/views/auth_checker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenHandler {
  Future<String?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("user");
    return token;
  }

  void storeUser(user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user);
  }

  Future<String?> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.remove("user");
    Get.off(() => const AuthChecker());
    return null;
  }
}
