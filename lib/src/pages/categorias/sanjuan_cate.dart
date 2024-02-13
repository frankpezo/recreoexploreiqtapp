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
            "Tu centro de esparcimiento familiar, con amplias áreas verdes y naturales, conectándote con la naturaleza para brindarte la mejor experiencia de relax y diversión junto a tu familia, alejada del bullicio de la ciudad. Te ofrecemos quebradas naturales, canchas de fútbol y voley, voley acuático, juegos de destreza física,pesca, zona de camping, circuito de super cross, música variada, platos regionales y bebidas en su punto. Ven y disfruta de una experiencia distinta rodeado de la naturaleza mágica de nuestra selva. También atendemos eventos corporativos y grupos de estudio.",
        catePlace: {
          "Lugar": '["qk1.jpg","qk2.jpg", "qk3.jpg"]',
        }),
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
