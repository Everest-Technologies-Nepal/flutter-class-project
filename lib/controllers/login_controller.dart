import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() {
    var isValid = formKey.currentState!.validate();
    if (isValid) {
       Get.snackbar("Success", "Login Success");
    } else {
      Get.snackbar("Error", "Fields are not valid");
    }
  }
}
