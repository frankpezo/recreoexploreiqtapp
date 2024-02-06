import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class SanjuanCate extends StatefulWidget {
  SanjuanCate({Key? key}) : super(key: key);

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
        horarioPlace: "Lunes a domingo, 8:00am - 6:00pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //2. Hacemos la lógica para la lista de visualizar las cateogrías
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: placeSanJuan.length,
            itemBuilder: (context, index) {
              return YourWidget(place: placeSanJuan[index]);
            }));
  }
}
