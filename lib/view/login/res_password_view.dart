import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 10,
              left: 140,
              child: Transform.rotate(
                angle: 122 / 360,
                child: Image.asset(
                  "assets/img/Pattern.png",
                  width: 360,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 120, width: double.infinity),
            Positioned(
              bottom: 0,
              child: Text(
                "Alterar a senha de login",
                style: TextStyle(
                    color: Tcolor.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'BentoSans'),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Por favor digite o seu email para receber\n o codigo de confrimação",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              //INICIO DOS INPUTS

              const SizedBox(height: 52),
              RoundTextField(
                hintText: "Seu email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 40,
              ),
              //FIM DOS CAMPOS DE INPUT

              RoundButton(title: "Enviar", onPressed: () => {}),
            ],
          ),
        ),
      ],
    )));
  }
}
