import 'package:flutter/material.dart';

class ProfileAdminScreen extends StatefulWidget {
  ProfileAdminScreen({Key? key}) : super(key: key);

  @override
  State<ProfileAdminScreen> createState() => _ProfileAdminScreenState();
}

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ADMIN PROFILE"),
      ),
    );
  }
}
