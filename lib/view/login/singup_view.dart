import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/round_text_field.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSobreNome = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEndereco = TextEditingController();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtConfirmarSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const LogoText(texto: "Se registrar"),
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
              const SizedBox(
                height: 24,
              ),
              RoundTextField(
                hintText: "Nome",
                controller: txtNome,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 24,
              ),
              RoundTextField(
                hintText: "Sobrenome",
                controller: txtSobreNome,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 24,
              ),
              RoundTextField(
                hintText: "Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              RoundTextField(
                hintText: "Celular -> (xx) xxxx-xxxx",
                controller: txtMobile,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 28),
              RoundTextField(
                hintText: "Senha",
                controller: txtSenha,
                obscureText: true,
              ),
              const SizedBox(height: 28),
              RoundTextField(
                hintText: "Confirmar a Senha",
                controller: txtConfirmarSenha,
                obscureText: true,
              ),
              const SizedBox(height: 36),
              //FIM DOS CAMPOS DE INPUT

              RoundButton(title: "Cadastrar", onPressed: () => {}),
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
}
