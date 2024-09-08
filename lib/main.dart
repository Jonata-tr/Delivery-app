import 'package:flutter/material.dart';
import 'package:delivery_app/view/on_boarding/startup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliveryApp",
      theme: ThemeData(
        fontFamily: "BentonSans",
        scaffoldBackgroundColor: const Color.fromARGB(153, 15, 15, 15),
      ),
      home: const StartupView(),
    );
  }
}
