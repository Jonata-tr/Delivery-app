import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? left;
  final Color? bgColor;

  const NormalTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.bgColor,
    this.left,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bgColor ?? Tcolor.textField,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          if (left != null)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: left!,
            ),
          Expanded(
            child: TextField(
              autocorrect: false,
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  helperText: '',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Tcolor.placeHolder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "BentoSans")),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
