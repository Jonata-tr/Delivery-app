import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:delivery_app/view/login/verify_email.dart';
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

  //Faz o login do usuario
  Future verifyEmail() async {
    //Tenta fazer o login
    try {
      //Confirma se os dados ja foram validados
      if (_key.currentState!.validate()) {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(
                  color: Tcolor.primaryColor,
                  backgroundColor: Tcolor.primaryColor,
                ),
              );
            });

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //Coleta o email e a senha digitadas, e cria o usuario no banco de dados;
          email: emailController.text,
          password: passwordController.text,
        );
        loginView();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop;
        showMessage("Ja existe uma conta com este email.");
      }
    }
    Navigator.of(context).pop;
  }

  void loginView() {
    Navigator.push(
        //Chama a proxima pagina
        context,
        MaterialPageRoute(builder: (context) => const VerifyEmail()));
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Tcolor.primaryColor,
              size: 32.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const LogoText(
              texto: "Vamos criar uma conta",
              verticalPosition: 155.0,
            ),
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

                  RoundButton(
                      title: "Cadastrar", onPressed: () => {verifyEmail()}),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()))
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

  //Cria uma caixa de dialogo que recebe uma 'mensagem' como parametro
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
