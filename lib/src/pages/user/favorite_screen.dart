import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class FavoriteUserScreen extends StatefulWidget {
  final ModelUser userF;
  FavoriteUserScreen({Key? key, required this.userF}) : super(key: key);

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
        distritoPlace: 'San Juan Bautista',
        phonePlace: 9999999999,
        palabrasClavesP: ['playa', 'piscina', 'zoológico'],
        nino_price: 5.0,
        adulto_price: 10.0,
        turista_price: 15.0,
        feriado_price: 15.0,
        horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0,
        descriptionPlace:
            "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
        catePlace: {
          "Zoológico": '["7.jpg", "8.jpg", "9.jpg"]',
          "Playa": '["pquis1.jpg", "pquis2.jpg"]'
        }),
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
                  return YourWidget(
                    place: listFavorite[index],
                    userCard: widget.userF,
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
