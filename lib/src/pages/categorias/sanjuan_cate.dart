import 'package:flutter/material.dart';

class SanjuanCate extends StatefulWidget {
  SanjuanCate({Key? key}) : super(key: key);

  @override
  State<SanjuanCate> createState() => _SanjuanCateState();
}

class _SanjuanCateState extends State<SanjuanCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SAN JUAN BAUTISTA CATEGORÍA"),
      ),
    );
  }
}
