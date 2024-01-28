import 'package:flutter/material.dart';

class LoginAdmin extends StatefulWidget {
  LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOGIN ADMIN"),
      ),
    );
  }
}
