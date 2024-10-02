import 'dart:async';

import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/button_icon.dart';
import 'package:delivery_app/components/logo_text.dart';
import 'package:delivery_app/main_tabview/main_tabview.dart';
import 'package:delivery_app/view/home/home_view.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  static const maxSeconds = 60;
  int seconds = 0;

  @override
  void initState() {
    super.initState();

    //usuario precisa ser criado antes de continuar
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    //Checa se o email ja foi verificado a cada 3 segundos
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
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
      isEmailVerified = FirebaseAuth.instance.currentUser!
          .emailVerified; //Coleta o estado atual da verificação do email do usuario.
    });

    if (isEmailVerified) {
      dispose();
      //Se o email ja estiver verificado, cancela a verificação do timer.
    }
  }

  //Responsavel por enviar o email para o usuario
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      //Pega o estado atual do usuario
      await user.sendEmailVerification();
      //Usa o metodo para enviar o email de verificação

      setState(() => canResendEmail = false);
      seconds = maxSeconds; //Bota o contador em 30
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        //Cria um contador que vai de 30 a 0
        if (seconds > 0) {
          //Diminui o contador ate chegar em 1
          setState(() {
            seconds--; //Cada segundo passado do contador diminui em um a variavel seconds
          });
        } else {
          //Se o numero for menor que 0, cancela a contagem e liberar o reenvio do email
          timer?.cancel();
          setState(() => canResendEmail = true);
        }
      });
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
  Widget build(BuildContext context) =>
      isEmailVerified //Se o email estiver verificado é criado a homepage, se não, é criado a tela de verificação de email
          ? const MainTabView()
          : Scaffold(
              body: Column(
                children: [
                  const LogoText(
                    texto: 'Verifique seu email',
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Foi enviado para o seu email, uma mensagem de confirmação. Por favor confirmar antes de prosseguir com a criação de conta.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Tcolor.secondaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 42),
                  InkWell(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Tcolor.primaryColor,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        icon: Icon(
                          Icons.email_rounded,
                          color: Tcolor.buttonText,
                        ),
                        label: Text(
                          seconds > 0 ? "$seconds" : 'Reenviar email',
                          style:
                              TextStyle(fontSize: 14, color: Tcolor.buttonText),
                        ),
                        onPressed:
                            canResendEmail ? sendVerificationEmail : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => {
                      FirebaseAuth.instance.signOut(),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (media) => const LoginView()))
                    },
                    child: Text(
                      "Cancelar Verificação",
                      style:
                          TextStyle(color: Tcolor.secundaryColor, fontSize: 14),
                    ),
                  )
                ],
              ),
            );
}
