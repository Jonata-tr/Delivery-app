import 'package:delivery_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class ViewAllTittleRow extends StatelessWidget {
  final String text;

  const ViewAllTittleRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "BentoSans",
              color: Tcolor.secundaryColor,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              "Veja mais",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "BentoSans",
                  color: Tcolor.primaryColor),
            ))
      ],
    );
  }
}
