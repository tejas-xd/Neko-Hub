import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:weeb_hub/firebase/googlesignin.dart';
import 'package:weeb_hub/screens/custom.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        const SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.displayName!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(user.email!),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customsetting(
                    s: "Edit Profile", i: Icons.account_circle_outlined),
                Container(
                  child: Icon(Icons.navigate_next),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customsetting(s: "Notification", i: Icons.notifications),
                Container(
                  child: Icon(Icons.navigate_next),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customsetting(s: "Downloads", i: Icons.download),
                Container(
                  child: Icon(Icons.navigate_next),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customsetting(s: "Dark Mode", i: Icons.circle),
                Container(
                  child: Icon(Icons.navigate_next),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.logout,color: Colors.red,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Logout",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400,color: Colors.red)),
                  ],
                ),
                margin: EdgeInsets.only(left: 15),
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class Customsetting extends StatelessWidget {
  const Customsetting({Key? key, required this.s, required this.i})
      : super(key: key);

  final IconData i;
  final String s;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(i),
          SizedBox(
            width: 10,
          ),
          Text(s, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        ],
      ),
      margin: EdgeInsets.only(left: 15),
    );
  }
}
