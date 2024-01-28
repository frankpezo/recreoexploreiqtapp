import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOGIN USER"),
      ),
    );
  }
}
