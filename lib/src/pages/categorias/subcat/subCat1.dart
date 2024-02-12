import 'package:flutter/material.dart';

class SubCat1 extends StatefulWidget {
  SubCat1({Key? key}) : super(key: key);

  @override
  State<SubCat1> createState() => _SubCat1State();
}

class _SubCat1State extends State<SubCat1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sub cat 1")),
    );
  }
}
