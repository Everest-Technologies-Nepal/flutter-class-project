import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  const CustomButton({super.key, required this.onPressed,  this.label="Login"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: Get.width,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child:  Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        )),
      ),
    );
  }
}
