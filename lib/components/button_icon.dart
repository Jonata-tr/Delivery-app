import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;
  final String icone;
  final Color color;

  const ButtonIcon(
      {super.key,
      required this.texto,
      required this.icone,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
        child: TextButton(
      onPressed: onPressed,
      child: Container(
        width: media.width * 0.35,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icone,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    ));
  }
}
