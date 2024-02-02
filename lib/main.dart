import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/src/pages/Splash_screen.dart';
import 'package:recreoexploreiqtapp/src/pages/welcome_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Para eliminar etiqueta
      debugShowCheckedModeBanner: false,

      //1. RUTAS
      initialRoute: "splash",
      routes: {
        "splash": (context) => SplashScreen(),
        "welcomeSplah": (context) => WelcomeSplah(),
      },
    );
  }
}
