import "package:delivery_app/components/round_button.dart";
import "package:delivery_app/view/welcome_screen/nextScreen.dart";
import "package:flutter/material.dart";

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void nextPage() {
    Navigator.push(
        //Chama a proxima pagina
        context,
        MaterialPageRoute(builder: (context) => const NextScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Cria um widget para estacar os itens da tela do logo
            SizedBox(
              height: media.width * .1,
            ),
            Image.asset(
              "assets/img/Illustration1.png",
              fit: BoxFit.fill,
            ),

            const Text(
              "Entregando felicidade \npara a sua vida",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentoSans',
                fontSize: 26,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: media.width * 0.06,
            ),

            const Text(
              "Comidas e plantas para todos os\n tipos de usuários.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentoSans',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: media.width * 0.125,
            ),

            RoundButton(
                title: "NEXT",
                type: RoundButtonType.bgPrimary,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (media) => const NextScreen()));
                }),
          ]),
    );
  }
}
