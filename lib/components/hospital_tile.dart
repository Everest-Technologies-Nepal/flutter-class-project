import 'package:authentication/models/hospital_model.dart';
import 'package:authentication/utis/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalTile extends StatelessWidget {
  final Hospital hospital;
  final Function onPressed;
  const HospitalTile({super.key, required this.onPressed, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width / 2,
        padding: const EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    "$baseUrl/${hospital.image}",
                    height: 50,
                    width: 50,
                  ),
                ),
                  Text (hospital.name)
              ]
            )),
      ),
    );
  }
}
