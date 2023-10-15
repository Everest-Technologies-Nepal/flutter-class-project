import 'dart:convert';
import 'package:authentication/models/hospital_model.dart';
import 'package:authentication/utis/utils.dart';
import 'package:authentication/views/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HospitalController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxList<Hospital> hospitals = RxList<Hospital>.empty();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getHospitals();
  }

  Future<void> addHospital() async {
    var isValid = formKey.currentState!.validate();
   if (isValid) {
      var data = {
       'name': nameController.text,
        'city': cityController.text,
        'address': addressController.text,
      };
      var response =
         await http.post(Uri.parse("$baseUrl/addHospital.php"), body: data);

      var responseBody = jsonDecode(response.body);
      if(responseBody["success"]) {
        Get.snackbar("Success", responseBody["message"]);
      }else{
        Get.snackbar("Error",responseBody["message"]);
      }
    } 
  }
  Future<void> getHospitals() async {
      var response =
         await http.get(Uri.parse("$baseUrl/getHospitals.php"));
      var responseBody = jsonDecode(response.body);
      if(responseBody["success"]) {
        var data  = responseBody["data"];

        hospitals.value = HospitalFromJson(jsonEncode(data));
        Get.snackbar("Success", responseBody["message"]);
      }else{
        Get.snackbar("Error",responseBody["message"]);
      }
  }
}
