import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeb_hub/firebase/googlesignin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/animelogo.gif",
              height: 300.0,
              width: 300.0,
            ),

            ElevatedButton(
                onPressed: (){
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Text("Google sign in"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
