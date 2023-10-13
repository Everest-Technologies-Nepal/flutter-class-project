import 'package:authentication/components/custom_button.dart';
import 'package:authentication/components/custom_field.dart';
import 'package:authentication/controllers/hospital_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditHospital extends GetView<HospitalController> {
  const AddEditHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Hospital"),
      ),
      body: Form(
        key:controller.formKey,
        child: Column(
          children: [
            const Text("Add Hospital"),
            const SizedBox(
              height: 20,
            ),
            CustomField(controller:controller.nameController, label: "Name"),  
            CustomField(controller:controller.cityController, label: "City"),  
            CustomField(controller:controller.addressController, label: "Address"), 
            CustomButton(onPressed: (){
              controller.addHospital();
            }) 
          ]
        ),
      ),
    );
  }
}
