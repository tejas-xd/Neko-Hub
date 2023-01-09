import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/shared/custom.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
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
