import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:weeb_hub/firebase/googlesignin.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              Text(user.displayName!),
              Text(user.email!),
              TextButton(onPressed: (){
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              }, child: const Text("logout"))
            ]),
      ),
    );
  }
}