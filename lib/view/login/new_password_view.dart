import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/form_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtConfirmarSenha = TextEditingController();

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
                "Nova senha",
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
                "Por favor digite a sua nova senha",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              //INICIO DOS INPUTS

              const SizedBox(height: 52),
              RoundTextField(
                validateType: validatePassword,
                hintText: "Nova senha",
                controller: txtSenha,
                obscureText: true,
              ),
              const SizedBox(height: 52),
              RoundTextField(
                validateType: validatePassword,
                hintText: "Confirme a senha",
                controller: txtConfirmarSenha,
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              //FIM DOS CAMPOS DE INPUT

              RoundButton(title: "Confirmar", onPressed: () => {}),
            ],
          ),
        ),
      ],
    )));
  }
}
