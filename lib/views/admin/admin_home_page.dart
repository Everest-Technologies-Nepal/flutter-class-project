import 'package:authentication/components/add_tile.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/utis/token_handler.dart';
import 'package:authentication/views/admin/add_edit_hospital.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Admin Home Page"),
          actions: [
            IconButton(
                onPressed: () {
                  TokenHandler().logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Wrap(
          children: [
            AddTile(
              onPressed: (){
                Get.to(()=>
                  const AddEditHospital()
                );
              }
            )
            
          ],
        ));
  }
}
