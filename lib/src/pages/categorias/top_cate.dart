import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class TopCate extends StatefulWidget {
  final ModelUser userT;
  TopCate({Key? key, required this.userT}) : super(key: key);

  @override
  State<TopCate> createState() => _TopCateState();

  // Declara la lista placesTop como estática
  static List<PlaceModel> placesTop = [
    // Inserta los datos aquí
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
          "Zoológico": '["img1", "img2"]',
          "Playa": '["img1", "img2"]'
        }),
    PlaceModel(
        id: 2,
        imagePlace: "4.jpg",
        nombrePlace: "Don Pepe",
        direPlace: "Pilar Nores de García",
        distritoPlace: 'Punchana',
        phonePlace: 9999999999,
        palabrasClavesP: ['cancha deportiva', 'piscina'],
        nino_price: 5.0,
        adulto_price: 10.0,
        turista_price: 15.0,
        feriado_price: 15.0,
        horarioPlace: "Lunes a domingo, 9:00am - 6:00pm",
        estadoPlace: "Cerrado",
        rakingPlace: 5.0,
        descriptionPlace:
            "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
        catePlace: {
          "Parqueo": '["img1", "img2"]',
          "Piscina": '["img1", "img2"]',
          "Restaurante": '["img1", "img2"]',
        }),
    PlaceModel(
        id: 3,
        imagePlace: "5.jpg",
        nombrePlace: "King Kong",
        direPlace: "Carretera Zungarococha km 8.8",
        distritoPlace: 'San Juan Bautista',
        phonePlace: 9999999999,
        palabrasClavesP: ['playa', 'carretera'],
        nino_price: 5.0,
        adulto_price: 10.0,
        turista_price: 15.0,
        feriado_price: 15.0,
        horarioPlace: "Lunes a domingo, 8:00am - 6:00pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0,
        descriptionPlace:
            "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
        catePlace: {
          "Cancha deportiva": '["img1", "img2"]',
          "Restaruante": '["img1", "img2"]'
        }),
  ];
}

class _TopCateState extends State<TopCate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        itemCount: TopCate.placesTop
            .length, // Accede a placesTop utilizando el nombre de la clase
        itemBuilder: (context, index) {
          return YourWidget(
            place: TopCate.placesTop[index],
            userCard: widget.userT,
          ); // Accede a placesTop utilizando el nombre de la clase
        },
      ),
    );
  }
}
