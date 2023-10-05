import 'package:authentication/components/custom_button.dart';
import 'package:authentication/components/custom_field.dart';
import 'package:authentication/components/logo.dart';
import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  
    const SignUpPage({super.key});

   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const Logo(),
              const Text("Login",style: TextStyle(fontSize: 30),),
              const SizedBox(height: 20,),
               CustomField(
                label: "Name",
                controller: controller.nameController,
                validator:(value){
                 if(!value.contains("@")){
                    return "Please enter valid email";
                 }
                 return null;
                }
              ),
               const SizedBox(height: 20,),
               CustomField(
                label: "Phone",
                controller: controller.phoneController,
                validator:(value){
                 if(!value.contains("@")){
                    return "Please enter valid email";
                 }
                 return null;
                }
              ),
               const SizedBox(height: 20,),
               CustomField(
                label: "Email",
                controller: controller.emailController,
                validator:(value){
                 if(!value.contains("@")){
                    return "Please enter valid email";
                 }
                 return null;
                }
              ),
               const SizedBox(height: 20,),
               CustomField(
                label: "Password",
                isPassword: true,
                controller: controller.passwordController,
                validator:(value){
                //if the length is greater than 6
                  if(value.length<6){
                      return "Password must be greater than 6";
                  }
                  return null;
                }
              ),
               const SizedBox(height: 20,),
                CustomButton(
                  label: "Sign Up",
                  onPressed: ()=>controller.login()
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>Get.back(),
                  child: const Text("Login",style: TextStyle(fontSize: 20),),
                )



            ],
          ),
        ),
      ),
    );
  }
}