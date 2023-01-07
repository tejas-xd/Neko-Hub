import 'package:flutter/material.dart';

class Custombar extends StatefulWidget {
  const Custombar({Key? key ,required this.title}) : super(key: key);

  final String title;

  @override
  State<Custombar> createState() => _CustombarState();
}

class _CustombarState extends State<Custombar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/logo.png",width:60,),
              SizedBox(width: 5,),
              Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
            ],
          ),
          Container(
              child: Icon( Icons.search_outlined,color: Colors.green,size: 30,),
              margin: EdgeInsets.only(right: 10),
          )
        ],
      ),
    );
  }
}
