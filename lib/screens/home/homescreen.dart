import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/shared/custom.dart';

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
        Custombar(title: "Home"),
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
