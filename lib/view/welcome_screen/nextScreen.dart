import "package:delivery_app/components/round_button.dart";
import "package:delivery_app/view/login/login_view.dart";
import "package:flutter/material.dart";


class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
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
            SizedBox(height: media.width * 0.1),
            Image.asset(
              "assets/img/Illustration2.png",
              fit: BoxFit.fill,
            ),
            SizedBox(height: media.width * 0.1),

            Container(
              padding: const EdgeInsets.only(left: 0.0, top: 0.0, right: 10.0),
              child: const Text(
                "A maior varidade de\n produtos voce encontra \naqui",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentoSans',
                  fontSize: 26,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: media.width * 0.06),

            const Text(
              "Uma grande variedades de comidas e lojas\n para poder satisfazer todos \nos usuarios.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentoSans',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: media.width * 0.125),

            RoundButton( //Componente da pasta Common_Widgt
                title: "NEXT",
                type: RoundButtonType.bgPrimary,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (media) => const LoginView()));
                })
          ]),
    );
  }
}
