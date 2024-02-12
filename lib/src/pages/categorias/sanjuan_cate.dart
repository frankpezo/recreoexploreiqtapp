import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class SanjuanCate extends StatefulWidget {
  final ModelUser userS;
  SanjuanCate({Key? key, required this.userS}) : super(key: key);

  @override
  State<SanjuanCate> createState() => _SanjuanCateState();
}

class _SanjuanCateState extends State<SanjuanCate> {
  //1. Creamos la lista
  final List<PlaceModel> placeSanJuan = [
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
            "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //2. Hacemos la lógica para la lista de visualizar las cateogrías
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: placeSanJuan.length,
            itemBuilder: (context, index) {
              return YourWidget(
                place: placeSanJuan[index],
                userCard: widget.userS,
              );
            }));
  }
}
