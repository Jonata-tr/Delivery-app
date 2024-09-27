import 'package:delivery_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:delivery_app/view/on_boarding/startup_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Prepara todas depencias que possam ser necessarias no decorrer do codigo, para evitar erros
  await Firebase.initializeApp(
    //inicia o firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DeliveryApp",
      theme: ThemeData(
        fontFamily: "BentonSans",
        scaffoldBackgroundColor: const Color.fromARGB(153, 0, 0, 0),
      ),
      home: const StartupView(),
    );
  }
}
