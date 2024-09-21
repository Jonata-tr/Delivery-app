import 'dart:async';

import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/view/home/testeLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    //usuario precisa ser criado antes de continuar
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    //Checa se o email ja foi verificado a cada 3 segundos
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  //Cancela a execução da função caso o email ja esteja verificado
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!
        .reload(); //Atualiza a informação do email do usuario

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel(); //Se o email ja estiver verificado, cancela a verificação de 3 minutos.
  }

  //Responsavel por enviar o email para o usuario
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!; //Pega o usuario atual
      await user
          .sendEmailVerification(); //Usa o metodo para enviar o email de verificação
    } catch (e) {
      showMessage(e.toString());
    }
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
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email'),
          ),
        );
}
