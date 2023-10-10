import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/controllers/signup_controller.dart';
import 'package:authentication/views/auth_checker.dart';
import 'package:authentication/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  Get.put(LoginController());
  Get.put(SignUpController());
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthChecker(),
    ),
  );
}
