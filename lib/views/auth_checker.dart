import 'dart:convert';

import 'package:authentication/controllers/hospital_controll.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/utis/token_handler.dart';
import 'package:authentication/views/admin/admin_home_page.dart';
import 'package:authentication/views/normal_user/home_page.dart';
import 'package:authentication/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    // await TokenHandler().logout();
    var user = await TokenHandler().getUser();
    var decodedUser = user != null ? jsonDecode(user) : null;
    if (decodedUser == null) {
      Get.off(() => const LoginPage());
    } else {
      var role = decodedUser["role"];
      pageAccordingToRole(role);
    }
  }

  void pageAccordingToRole(role) {
    switch (role) {
      case '1':
        Get.off(() =>  HomePage());
        break;
      case '2':
       
      Get.off(() =>  AdminHome());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
