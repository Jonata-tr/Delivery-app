import '../common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, 
      child: SizedBox(
        width: 146,
          height: 42,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: type == RoundButtonType.bgPrimary //Muda o fundo do button dependendo do tipo dele, o secundario é um butao sem fundo e com bordas.
                    ? Tcolor.primaryColor
                    : Tcolor.bgSecundary,
                side: type == RoundButtonType.bgPrimary //Cria uma borda caso seja criado um butao secundario
                    ? null
                    : BorderSide(width: 2.0, color: Tcolor.primaryColor)), 
            onPressed: onPressed, //Faz com o onPressed seja definido apenas na passada de parametros da classe
            child: Text(
              title,
              style: TextStyle(
                color: type == RoundButtonType.bgPrimary
                    ? Colors.white
                    : Tcolor.buttonText, //Muda a cor do texto baseado no tipo do butao
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
