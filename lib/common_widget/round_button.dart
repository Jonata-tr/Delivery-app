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
      child: SizedBox(
          width: 164,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Tcolor.primaryColor,
            ),
            onPressed: onPressed,
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
          )),
    );
  }
}
