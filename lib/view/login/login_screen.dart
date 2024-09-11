import 'package:delivery_app/common_widget/round_button.dart';
import 'package:delivery_app/common_widget/round_text_field.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:delivery_app/view/login/singup_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/img/Pattern.png",
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 10,
                  child: Image.asset(
                    width: media.width,
                    "assets/img/Gradient.png",
                  ),
                ),
                Image.asset(
                  "assets/img/Logo.png",
                  width: media.width * 0.4,
                  height: media.height * 0.4,
                  fit: BoxFit.contain,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Bem vindo a familia verdinha.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "BentoSans",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            RoundButton(
              title: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (media) => const LoginView()),
                );
              },
              type: RoundButtonType.textPrimary,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
                title: "Registrar",
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingupScreen()))
                    },
                type: RoundButtonType.bgPrimary),
          ],
        ),
      ),
    );
  }
}
