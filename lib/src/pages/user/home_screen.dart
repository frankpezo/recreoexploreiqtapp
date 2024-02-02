import 'package:flutter/material.dart';

class HomeUserScreen extends StatefulWidget {
  HomeUserScreen({Key? key}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("User Inicio"),
      ),
    );
  }
}
