import 'package:delivery_app/common/color_extension.dart';
import 'package:delivery_app/components/form_text_field.dart';
import 'package:delivery_app/components/normal_text_field.dart';
import 'package:delivery_app/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    final txtSearch = TextEditingController();

    void userLogout() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Rua da Catita, N°24',
                            style: TextStyle(
                              fontFamily: 'BentoSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Tcolor.buttonText,
                            ),
                          ),
                          SizedBox(
                            width: media.width * 0.04,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Tcolor.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.12,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Tcolor.primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: NormalTextField(
                  hintText: "Persquisar sua comida",
                  controller: txtSearch,
                  left: Icon(
                    Icons.search,
                    color: Tcolor.buttonText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
