import 'package:flutter/material.dart';

class BelenCate extends StatefulWidget {
  BelenCate({Key? key}) : super(key: key);

  @override
  State<BelenCate> createState() => _BelenCateState();
}

class _BelenCateState extends State<BelenCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("BELÉN CATEGORÍA"),
      ),
    );
  }
}
