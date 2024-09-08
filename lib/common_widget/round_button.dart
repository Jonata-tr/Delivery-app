import '../common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 158,
        height: 58,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Tcolor.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
      child: Text(
        title, 
        style: TextStyle(
          color: Tcolor.buttonText,
          fontSize: 16,
          fontFamily: 'BentoSans',
          fontWeight: FontWeight.bold,
          letterSpacing: 2.5,
        ),
      ),
    ));
  }
}
