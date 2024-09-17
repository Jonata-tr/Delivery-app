import 'package:flutter/material.dart';
import '../common/color_extension.dart';

enum ValidateType { validateEmail, validatePassword }

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String> validateType;
  const RoundTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.obscureText = false,
      required this.validateType});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Tcolor.textField,
          ),
        ),
        TextFormField(
          validator: validateType,
          autocorrect: false,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              helperText: ' ',
              filled: true, //Permite adicionar background no campo d input
              fillColor: Tcolor.textField,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 83, 83, 83))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Tcolor.primaryColor,
                  )),
              hintText: hintText, //Placeholder do input
              hintStyle: TextStyle(
                  color: Tcolor.placeHolder,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "BentoSans")),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
