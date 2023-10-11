import 'dart:convert';
import 'package:authentication/views/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final singUPformKey = GlobalKey<FormState>(
      debugLabel: "singUPformKey"
  );

  Future<void> signUp() async {
    var isValid = singUPformKey.currentState!.validate();
   if (isValid) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
        'name': nameController.text,
        'phone': phoneController.text,
      };
      var response =
         await http.post(Uri.parse("http://192.168.1.68/signup.php"), body: data);

      var responseBody = jsonDecode(response.body);
      if(responseBody["success"]) {
        // var token  = responseBody["token"];
        // TokenHandler().storeToken(token);
        Get.off(()=>
            const AuthChecker()
        );
        Get.snackbar("Success", responseBody["message"]);
      }else{
        Get.snackbar("Error",responseBody["message"]);
      }
    } else {
      Get.snackbar("Error", "Fields are not valid");
    }
  }
}
