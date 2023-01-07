import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          child: Row(
          children: [
            Image.asset("assets/logo.png",width:80,),
          ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 100,
          width: 200,
          child: ListView(

          ),


        ),

      ],
    );
  }
}
