import 'package:flutter/material.dart';

class HomeAdminScreen extends StatefulWidget {
  HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ADMIN HOME"),
      ),
    );
  }
}
