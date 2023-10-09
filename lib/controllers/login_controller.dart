import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() async {
    var isValid = formKey.currentState!.validate();

    if (isValid) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var response =
        await  http.post(Uri.parse("http://192.168.1.68/login.php"), body: data);

      print(response.body);
      Get.snackbar("Success", "Login Success");
    } else {
      Get.snackbar("Error", "Fields are not valid");
    }
  }
}
