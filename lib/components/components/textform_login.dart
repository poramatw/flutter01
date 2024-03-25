import 'package:flutter/material.dart';

class TextFormLogin extends StatelessWidget {
  // create variables
  String hintTxt;
  TextEditingController controller;
  bool secure = false;
  Widget? icon;

  TextFormLogin(
      {super.key,
      required this.hintTxt,
      required this.controller,
      this.icon,
      required this.secure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: secure,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: hintTxt,
            suffixIcon: icon,
            ),
        
      ),
    );
  }
}
