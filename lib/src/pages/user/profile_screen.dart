import 'package:flutter/material.dart';

class ProfileUserScreen extends StatefulWidget {
  ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile User Screen"),
      ),
    );
  }
}
