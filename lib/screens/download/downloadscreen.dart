import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/shared/custom.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
