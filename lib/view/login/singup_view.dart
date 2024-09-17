import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/components/normal_text_field.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/form_text_field.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void singUserIn() async {
    try {
      if (_key.currentState!.validate()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //Coleta o email e a senha digitadas, e cria o usuario no banco de dados;
          email: emailController.text,
          password: passwordController.text,
        );
        setState(() {});
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showErro("Ja existe uma conta com este email.");
      } else if (e.code == 'wrong-password') {}
    }
  }

  String? validatesPasswordMatch(String? formEmail) {
    if (formEmail != passwordController.text) {
      return 'As senhas precisam ser iguais';
    }

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'A senha não pode estar vazia';
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'; //Regex que vai procurar uma senha com(letra, maiuscula, numero e simbolo)
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''A senha deve conter pelo menos:
  8 caracteres
  1 letra maiuscula
  1 numero
  1 simbolo
      ''';
    }

    if (formPassword != confirmPassword.text) {
      return 'As senhas precisam ser iguais';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const LogoText(texto: "Vamos criar uma conta"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Adicione suas informações para o cadastro",
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              //INICIO DOS INPUTS

              Form(
                key: _key,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    validateType: validateEmail,
                    hintText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 22),
                  RoundTextField(
                    validateType: validatePassword,
                    hintText: "Senha",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 22),
                  RoundTextField(
                    validateType: validatesPasswordMatch,
                    hintText: "Confirmar a Senha",
                    controller: confirmPassword,
                    obscureText: true,
                  ),
                  const SizedBox(height: 36),
                ]),
              ),
              //FIM DOS CAMPOS DE INPUT

              RoundButton(title: "Cadastrar", onPressed: () => {singUserIn()}),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ja possui uma conta?",
                    style: TextStyle(
                        color: Tcolor.secondaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()))
                    },
                    child: Text(
                      "Login",
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

  void showErro(String string) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(string),
            ),
          );
        });
  }
}

//Cria uma função que pode retorna nulo ou não --> (? -> significa que ela pode retorna o tipo String ou null)
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
