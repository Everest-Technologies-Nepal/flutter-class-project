import 'package:authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   final   LoginController loginController = Get.find<LoginController>();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Text("Home Page"),
      actions: [
        IconButton(onPressed: (){
          loginController.logout();
        }, icon: const Icon(Icons.logout))
      ],
    ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}