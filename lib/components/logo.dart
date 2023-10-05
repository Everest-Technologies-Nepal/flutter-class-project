import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;
  const Logo({super.key,  this.height=200,  this.width=200});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/logo.png",
        width: width,
        height: height,
      )   
    );
  }
}