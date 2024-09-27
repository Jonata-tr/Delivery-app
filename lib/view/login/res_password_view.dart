import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../components/round_button.dart';
import '../../components/form_text_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();

  @override
  void dispose() {
    txtEmail.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: txtEmail.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (media) => LoginView()));
    } on FirebaseAuthException catch (e) {
      showMessage(e.toString());
    }
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
              texto: 'Esqueceu a sua senha?',
              verticalPosition: 155.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Por favor digite o seu email para receber\n o link para alteração da senha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Tcolor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  //INICIO DOS INPUTS

                  const SizedBox(height: 40),
                  RoundTextField(
                    validateType: validateEmail,
                    hintText: "Seu email",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //FIM DOS CAMPOS DE INPUT

                  RoundButton(
                      title: "Enviar", onPressed: () => {passwordReset()}),
                ],
              ),
            ),
          ],
        )));
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
}
