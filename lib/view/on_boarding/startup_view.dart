import 'package:flutter/material.dart';

import '../welcome_screen/welcomeScreen.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState(); //
    goWelcomePage();
  }

  void goWelcomePage() async {
    /*
        Ao marcar uma função com a palavra-chave async, você está informando ao Dart que essa função pode conter operações assíncronas. Isso permite que você utilize a palavra-chave await dentro da função para esperar pela conclusão de operações assíncronas sem bloquear a execução do restante do código.
      */
    await Future.delayed(const Duration(
        seconds: 2)); //Tempo de espera para carregar a proxima pragina.
    welcomePage();
  }

  void welcomePage() {
    Navigator.push(
        //Chama a proxima pagina
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context)
        .size; //Coleta o tamanho da tela do dispositivo do usuario.

    return Scaffold(
        body: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          //Cria um widget para estacar os itens da tela do logo
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                width: media.width,
                "assets/img/Pattern.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              child: Image.asset(
                width: media.width,
                "assets/img/Gradient.png",
              ),
            ),
            Container(
                width: 800,
                height: media.height,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.8, 0.2],
                  colors: [
                    Color.fromARGB(52, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ))),
            Positioned(
                top: 200,
                child: Image.asset(
                  // Adiciona a logo da na tela de inicialização.
                  "assets/img/Logo.png",
                  width: media.width * 0.55,
                  height: media.height * 0.55,
                  fit: BoxFit.contain,
                )),
          ],
        ),
      ],
    ));
  }
}
