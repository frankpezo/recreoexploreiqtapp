import 'package:flutter/material.dart';

class IquitosCate extends StatefulWidget {
  IquitosCate({Key? key}) : super(key: key);

  @override
  State<IquitosCate> createState() => _IquitosCateState();
}

class _IquitosCateState extends State<IquitosCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("IQUITOS CATEGORÍA"),
      ),
    );
  }
}
