import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTile extends StatelessWidget {
  final Function onPressed;
  const AddTile({super.key, required this.onPressed});

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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add), Text("Add Hospital")],
            )),
      ),
    );
  }
}
