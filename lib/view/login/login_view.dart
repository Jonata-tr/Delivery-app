import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/button_icon.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/view/login/res_password_view.dart';
import 'package:delivery_app/view/login/singup_view.dart';
import 'package:delivery_app/view/login/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/form_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //controles do campo de texto do login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  //Server para poder formatar o formulario de forma global no codigo, permite usar o validate();

  void singUserIn() async {
    try {
      if (_key.currentState!.validate()) {
        showDialog(
            //Loading icon
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(
                  color: Tcolor.primaryColor,
                  backgroundColor: Tcolor.primaryColor,
                ),
              );
            });

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          //Adquiri o email e a senha e compara no banco de dados para fazer o login do usuario caso esteja tudo certo;
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.of(context, rootNavigator: true).pop();

        Navigator.push(context,
            MaterialPageRoute(builder: (media) => const VerifyEmail()));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();

      showMessage(e.toString());
    }

    // ignore: use_build_context_synchronously
  }

  void showMessage(String string) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: const Color.fromARGB(255, 39, 39, 39),
            title: Center(
              child: Text(
                string,
                style: TextStyle(
                  color: Tcolor.buttonText,
                  fontSize: 18,
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pop;
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
              Form(
                key: _key,
                child: Column(
                  children: [
                    RoundTextField(
                      validateType: validateEmail,
                      hintText: "Seu email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    RoundTextField(
                      validateType: validatePassword,
                      hintText: "Sua senha",
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 36),
                    RoundButton(
                        title: "Login", onPressed: () => {singUserIn()}),
                  ],
                ),
              ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIcon(
                      //Componente criado para suporta um botão com os intens de uma imagem e um texto dentro dele.
                      texto: "Facebook",
                      icone: "assets/img/facebook.png",
                      color: const Color.fromARGB(255, 34, 34, 34),
                      onPressed: () {}),
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
                        fontSize: 14,
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

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'O endereçoo de e-mail é necessario';
  }

  String pattern = r'\w+@\w+\.\w+';
  //Procura por uma string que tenha a seguinte composição: letras + @ + letras + . + letras. Ex => (teste@asas.com)
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return 'Formato invalido de E-mail';
  }
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'A senha não pode estar vazia';
  }

  return null;
}
