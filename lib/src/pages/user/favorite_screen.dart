import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class FavoriteUserScreen extends StatefulWidget {
  FavoriteUserScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteUserScreen> createState() => _FavoriteUserScreenState();
}

class _FavoriteUserScreenState extends State<FavoriteUserScreen> {
  final List<PlaceModel> listFavorite = [
    PlaceModel(
        id: 1,
        imagePlace: "quis.jpg",
        nombrePlace: "Quistococha",
        direPlace: "Carretera Iquitos - Nauta, km 6.5",
        horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0),
    PlaceModel(
        id: 1,
        imagePlace: "quis.jpg",
        nombrePlace: "Quistococha",
        direPlace: "Carretera Iquitos - Nauta, km 6.5",
        horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //  padding: const EdgeInsets.all(30),
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
                )),
            Expanded(
              child: ListView.builder(
                itemCount: listFavorite.length,
                itemBuilder: (context, index) {
                  return YourWidget(place: listFavorite[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
