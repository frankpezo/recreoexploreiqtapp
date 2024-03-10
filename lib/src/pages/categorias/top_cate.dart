import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class TopCate extends StatefulWidget {
  final ModelUser? userT;
  TopCate({Key? key, this.userT}) : super(key: key);

  @override
  State<TopCate> createState() => _TopCateState();

  // Declara la lista placesTop como estática
  static List<PlaceModel> placesTop = [
    // Inserta los datos aquí
    PlaceModel(
      idLocal: 1,
      imagePlace: "quis.jpg",
      nombrePlace: "Quistococha",
      direPlace: "Carretera Iquitos - Nauta, km 6.5",
      distritoPlace: 'San Juan Bautista',
      phonePlace: '9999999999',
      palabrasClavesP: ['playa', 'piscina', 'zoológico'],
      nino_price: '5.0',
      adulto_price: '10.0',
      turista_price: '15.0',
      feriado_price: '15.0',
      horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
      estadoPlace: "Abierto",
      /*  rakingPlace: 5.0,
      descriptionPlace:
          "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
      catePlace: {
        "Zoológico": '["7.jpg", "8.jpg", "9.jpg"]',
        "Playa": '["pquis1.jpg", "pquis2.jpg"]'
      }, */
      /*  comentPlace: [
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
      ], */
    ),
    PlaceModel(
      idLocal: 2,
      imagePlace: "4.jpg",
      nombrePlace: "Don Pepe",
      direPlace: "Pilar Nores de García",
      distritoPlace: 'Punchana',
      phonePlace: '9999999999',
      palabrasClavesP: ['cancha deportiva', 'piscina', 'punchana'],
      nino_price: '5.0',
      adulto_price: '10.0',
      turista_price: '15.0',
      feriado_price: '15.0',
      horarioPlace: "Lunes a domingo, 9:00am - 6:00pm",
      estadoPlace: "Cerrado",
      /*  rakingPlace: 5.0,
      descriptionPlace:
          "Recreo Turístico “Don Pepe” Iquitos es un excelente centro de esparcimiento que debe conocer en su visita a la ciudad de Iquitos. Recreo Turístico “Don Pepe” Iquitos cuenta con Piscinas en Iquitos, para niños y adultos, Restaurante Campestre que ofrece deliciosas comidas típicas, Canchas de Voley, cancha sintética de Fútbol en Iquitos.",
      catePlace: {
        "Piscina": '["ppis1.jpg","ppis2.jpg", "ppis3.jpg"]',
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
      ], */
    ),
    PlaceModel(
      idLocal: 3,
      imagePlace: "5.jpg",
      nombrePlace: "King Kong",
      direPlace: "Carretera Zungarococha km 8.8",
      distritoPlace: 'San Juan Bautista',
      phonePlace: '9999999999',
      palabrasClavesP: ['playa', 'carretera'],
      nino_price: '5.0',
      adulto_price: '10.0',
      turista_price: '15.0',
      feriado_price: '15.0',
      horarioPlace: "Lunes a domingo, 8:00am - 6:00pm",
      estadoPlace: "Abierto",
      /*  rakingPlace: 5.0,
      descriptionPlace:
          "Tu centro de esparcimiento familiar, con amplias áreas verdes y naturales, conectándote con la naturaleza para brindarte la mejor experiencia de relax y diversión junto a tu familia, alejada del bullicio de la ciudad. Te ofrecemos quebradas naturales, canchas de fútbol y voley, voley acuático, juegos de destreza física,pesca, zona de camping, circuito de super cross, música variada, platos regionales y bebidas en su punto. Ven y disfruta de una experiencia distinta rodeado de la naturaleza mágica de nuestra selva. También atendemos eventos corporativos y grupos de estudio.",
      catePlace: {
        "Lugar": '["qk1.jpg","qk2.jpg", "qk3.jpg"]',
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
      ], */
    ),
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
            userCard: widget.userT!,
          ); // Accede a placesTop utilizando el nombre de la clase
        },
      ),
    );
  }
}
