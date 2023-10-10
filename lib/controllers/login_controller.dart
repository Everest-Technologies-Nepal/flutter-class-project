import 'dart:convert';

import 'package:authentication/views/auth_checker.dart';
import 'package:authentication/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() async  {
    var isValid = formKey.currentState!.validate();

    if (isValid) {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var response =
         await http.post(Uri.parse("http://192.168.1.68/login.php"), body: data);

      var responseBody = jsonDecode(response.body);
      if(responseBody["success"]) {
        var token  = responseBody["token"];
        storeToken(token);
        Get.off(()=> const AuthChecker());
        Get.snackbar("Success", responseBody["message"]);
      }else{
        Get.snackbar("Error",responseBody["message"]);
      }
    } else {
      Get.snackbar("Error", "Fields are not valid");
    }

   
  }

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
      Get.off(()=>const AuthChecker());
      return null;
    }


  
}
