import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/view/login/singup_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_text_field.dart';

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
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 16,
              left: 160,
              child: Transform.rotate(
                angle: 190 / 360,
                child: Image.asset(
                  "assets/img/Pattern.png",
                  width: 360,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 160, width: double.infinity),
            Positioned(
              bottom: 0,
              child: Text(
                "Login",
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
                onPressed: () {},
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
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 58,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 34, 34, 34),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/google.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Google",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.02,
                  ),
                  InkWell(
                      child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 150,
                      height: 58,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 34, 34, 34),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/facebook.png",
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Facebook",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )),
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
                        fontSize: 16,
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
                      "Crie uma conta",
                      style: TextStyle(
                          color: Tcolor.primaryColor,
                          fontSize: 16,
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
