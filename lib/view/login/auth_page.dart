import 'package:delivery_app/view/login/verify_email.dart';
import 'package:delivery_app/view/welcome_screen/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance
            .authStateChanges(), //Fica verificando se o usuario esta ou não logado
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Caso o usuario esteja logado, leva para a tela de inicio do app
            return const VerifyEmail();
          } else {
            //caso ele não esteja logado, leva para a tela de apresentação -> splash-screen
            return const WelcomePage();
          }
        },
      ),
    );
  }
}
