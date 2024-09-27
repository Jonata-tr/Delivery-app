import 'package:delivery_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final String texto;
  final double verticalPosition;
  final double horizontalPosition;

  const LogoText(
      {super.key,
      required this.texto,
      this.verticalPosition = 55.0,
      this.horizontalPosition = 120.0});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: verticalPosition,
          left: horizontalPosition,
          child: Transform.rotate(
            angle: 170 / 360,
            child: Image.asset(
              "assets/img/Pattern.png",
              width: 380,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: media.height * 0.22, width: double.infinity),
        Positioned(
          bottom: 0,
          child: Text(
            texto,
            style: TextStyle(
                color: Tcolor.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'BentoSans'),
          ),
        )
      ],
    );
  }
}
