import 'dart:convert';
import 'package:authentication/views/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HospitalController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> addHospital() async {
    var isValid = formKey.currentState!.validate();
   if (isValid) {
      var data = {
       'name': nameController.text,
        'city': cityController.text,
        'address': addressController.text,
      };
      var response =
         await http.post(Uri.parse("http://192.168.1.68/addHospital.php"), body: data);

      var responseBody = jsonDecode(response.body);
      if(responseBody["success"]) {
        Get.snackbar("Success", responseBody["message"]);
      }else{
        Get.snackbar("Error",responseBody["message"]);
      }
    } 
  }
}
