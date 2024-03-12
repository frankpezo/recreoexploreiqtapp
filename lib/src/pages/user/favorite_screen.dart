import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart'; // Importa la clase Databasehelper
import 'package:recreoexploreiqtapp/src/pages/user/viewCardUser.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class FavoriteUserScreen extends StatefulWidget {
  final ModelUser? userF;
  final int? idUserF;
  final String? emailUserF;
  FavoriteUserScreen({Key? key, this.userF, this.idUserF, this.emailUserF})
      : super(key: key);

  @override
  State<FavoriteUserScreen> createState() => _FavoriteUserScreenState();
}

class _FavoriteUserScreenState extends State<FavoriteUserScreen> {
  List<LocalModel> favoritePlaces =
      []; // Lista para almacenar los lugares favoritos

  @override
  void initState() {
    super.initState();
    // Cargar los lugares favoritos al inicializar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/icon2.1.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'RecreoExplore',
                      style: TextStyle(
                        color: Color(0xFF238F8F),
                        fontSize: 17.0,
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
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Text(
                "Favoritos",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoritePlaces.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewCardUser(
                            userVC: widget.userF,
                            idUserVC: widget.idUserF,
                            emailUserVc: widget.emailUserF,
                            idLocalVC: favoritePlaces[index].idLocal,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(18.0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Aquí puedes mostrar la imagen del lugar
                            // Se omite por brevedad, asegúrate de cargar la imagen adecuadamente
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${favoritePlaces[index].nombreLocal}',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    '${favoritePlaces[index].distritoLocal}',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    '${favoritePlaces[index].horarioLocal}',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
