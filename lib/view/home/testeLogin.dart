import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {userLogout()}, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Voce esta logado, olha essa imagem legal",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Image.network(
              'https://s2-g1.glbimg.com/l7fUkvdovxaODjM-7_LKacF-pU4=/0x0:1700x1065/1008x0/smart/filters:strip_icc()/s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/photos/apis/b03aa813eaaa4e059f069c843d77415a/selfie.jpg')
        ],
      ),
    );
  }
}

void userLogout() {
  FirebaseAuth.instance.signOut();
}
