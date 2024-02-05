import 'package:flutter/material.dart';

class PunchanaCate extends StatefulWidget {
  PunchanaCate({Key? key}) : super(key: key);

  @override
  State<PunchanaCate> createState() => _PunchanaCateState();
}

class _PunchanaCateState extends State<PunchanaCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PUNCHANA CATEGORÍA"),
      ),
    );
  }
}
