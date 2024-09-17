import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

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
          Text(
            "Esta usando a conta: " + user!.email!,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Olha que macaco foda",
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
