import 'package:authentication/components/add_tile.dart';
import 'package:authentication/components/hospital_tile.dart';
import 'package:authentication/controllers/hospital_controll.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/models/hospital_model.dart';
import 'package:authentication/utis/token_handler.dart';
import 'package:authentication/views/admin/add_edit_hospital.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends GetView<HospitalController> {
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
        body: Column(
          children: [
            AddTile(
              onPressed: () {
                Get.to(() => const AddEditHospital());
              },
            ),
            Obx(() => Wrap(
                  children: controller.hospitals
                      .map((Hospital hospital) =>  HospitalTile(hospital: hospital, onPressed: (){},))
                      .toList(),
                )),
          ],
        ));
  }
}
