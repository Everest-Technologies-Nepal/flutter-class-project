import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/utis/token_handler.dart';
import 'package:authentication/views/home_page.dart';
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
    var token=await TokenHandler().getToken();

    if (token != null) {
      Get.off(() =>  HomePage());
    } else {
      Get.off(() => const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
