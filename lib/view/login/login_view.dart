import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/button_icon.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/view/login/res_password_view.dart';
import 'package:delivery_app/view/login/singup_view.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/round_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const LogoText(texto: "Login"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Adicione as informações da sua conta",
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 24,
              ),
              RoundTextField(
                hintText: "Seu email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              
              const SizedBox(height: 28),
              RoundTextField(
                hintText: "Sua senha",
                controller: txtSenha,
                obscureText: true,
              ),

              const SizedBox(height: 36),
              RoundButton(title: "Login", onPressed: () => {}),
              
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordView()));
                },
                child: Text(
                  "Esqueceu a sua senha?",
                  style: TextStyle(
                      color: Tcolor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Ou entre com",
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonIcon( //Componente criado para suporta um botão com os intens de uma imagem e um texto dentro dele.
                      texto: "Facebook",
                      icone: "assets/img/facebook.png",
                      color: const Color.fromARGB(255, 34, 34, 34),
                      onPressed: () {}),
                  SizedBox(
                    width: media.width * 0.02,
                  ),
                  ButtonIcon(
                    icone: "assets/img/google.png",
                    texto: "Google",
                    color: const Color.fromARGB(255, 34, 34, 34),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ainda não possui cadastro?",
                    style: TextStyle(
                        color: Tcolor.secondaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingupScreen()))
                    },
                    child: Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Tcolor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    )));
  }
}
