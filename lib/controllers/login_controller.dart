import 'dart:convert';

import 'package:authentication/utis/token_handler.dart';
import 'package:authentication/utis/utils.dart';
import 'package:authentication/views/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>(
      debugLabel: "loginFormKey"
  );

  void login() async {
    var isValid = formKey.currentState!.validate();

    if (isValid) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var response = await http.post(Uri.parse("$baseUrl/login.php"),
          body: data);
      var responseBody = jsonDecode(response.body);
      if (responseBody["success"]) {
        var data = responseBody;
        TokenHandler().storeUser(jsonEncode(data));
        formKey.currentState!.reset();
        Get.off(() => const AuthChecker());
        Get.snackbar("Success", responseBody["message"]);
      } else {
        Get.snackbar("Error", responseBody["message"]);
      }
    } else {
      Get.snackbar("Error", "Fields are not valid");
    }
  }
}
