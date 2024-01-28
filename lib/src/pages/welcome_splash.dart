import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/src/pages/user/login_user.dart';

import 'admin/login_admin.dart';

class WelcomeSplah extends StatefulWidget {
  WelcomeSplah({Key? key}) : super(key: key);

  @override
  State<WelcomeSplah> createState() => _WelcomeSplahState();
}

class _WelcomeSplahState extends State<WelcomeSplah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.srcOver,
            ),
            child: AnotherCarousel(
              images: const [
                AssetImage("assets/images/2.jpg"),
                AssetImage("assets/images/3.1.jpg"),
                AssetImage("assets/images/1.jpg"),
              ],
              dotSize: 6,
              indicatorBgPadding: 5.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'RecreoExplore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'IQT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 70.0,
            child: Column(
              children: [
                GestureDetector(
                  //1. Para login de usuario
                  //Si queremos reemplazar la página un vez cliqueada
                  //utlizamos: pushReplacement
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginUser())),
                  child: Container(
                    width: 270.0, // Ancho ajustado según tus necesidades
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF238F8F),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Buscar recreo turístico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        //fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  //Registro admin
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginAdmin())),
                  child: Container(
                    width: 270.0, // Ancho ajustado según tus necesidades
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF238F8F),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Registrar recreo turístico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
