import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  const RoundTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Tcolor.textField,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        autocorrect: false,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Tcolor.placeHolder,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "BentoSans")),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
