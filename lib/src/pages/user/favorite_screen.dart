import 'package:flutter/material.dart';

class FavoriteUserScreen extends StatefulWidget {
  FavoriteUserScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteUserScreen> createState() => _FavoriteUserScreenState();
}

class _FavoriteUserScreenState extends State<FavoriteUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PAGE USER FAVORITE"),
      ),
    );
  }
}
