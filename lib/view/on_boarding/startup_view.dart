import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack( //Cria um widget para estacar os itens da tela do logo
      children: [
        Image.asset(
          "assets/img/Logo.jpg",
          width: media.width * 0.7,
          height: media.height * 0.7,
          fit: BoxFit.contain,
        )
      ],
    ));
  }
}