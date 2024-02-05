import 'package:flutter/material.dart';

class TopCate extends StatefulWidget {
  TopCate({Key? key}) : super(key: key);

  @override
  State<TopCate> createState() => _TopCateState();
}

class _TopCateState extends State<TopCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TOP CATEGORÍA"),
      ),
    );
  }
}
