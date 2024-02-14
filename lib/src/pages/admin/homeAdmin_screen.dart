import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/carEditPlaces.dart';

class HomeAdminScreen extends StatefulWidget {
  final EmpresaModel userH;
  HomeAdminScreen({Key? key, required this.userH}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
  static List<PlaceModel> placeE = [
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
      },
      comentPlace: [
        {
          "id": 1,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 1',
          'comment': 'Comentario del usuario 1',
          'rating': 3.0,
        },
        {
          "id": 2,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 2',
          'comment': 'Comentario del usuario 2',
          'rating': 4.0,
        },
        // Puedes agregar más comentarios aquí
        {
          "id": 2,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 3',
          'comment': 'Comentario del usuario 3',
          'rating': 5.0,
        },
      ],
    ),
  ];
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            30), // Reducir el padding para dispositivos más pequeños
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo y título
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Añadir espacio vertical
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/icon2.1.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
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
            SizedBox(
              height: 30,
            ),
            // Aquí puedes agregar más elementos según sea necesario
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Mi local",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Cambió de pantalla xd");
                    },
                    child: Card(
                      margin: EdgeInsets.all(16.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF238F8F),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Agregar local",
                            style: TextStyle(
                                color: Color(0xFF238F8F),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: HomeAdminScreen.placeE.length,
                      itemBuilder: (context, index) {
                        return YourWidgetEditP(
                          place: HomeAdminScreen.placeE[index],
                          userC: widget.userH,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
