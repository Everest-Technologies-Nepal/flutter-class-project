import 'package:authentication/controllers/hospital_controll.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/controllers/signup_controller.dart';
import 'package:authentication/views/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(LoginController());
  Get.put(SignUpController());
 Get.put(HospitalController());
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
