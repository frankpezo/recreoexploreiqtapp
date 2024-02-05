import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class TopCate extends StatefulWidget {
  TopCate({Key? key}) : super(key: key);

  @override
  State<TopCate> createState() => _TopCateState();
}

class _TopCateState extends State<TopCate> {
  //1. Lllamamos al modelo Place y le insertamos algunos datos (de momento no serán dinámicos)
  final List<PlaceModel> placesTop = [
    //a.
    PlaceModel(
        id: 1,
        imagePlace: "quis.jpg",
        nombrePlace: "Quistococha",
        direPlace: "Carretera Iquitos - Nauta, km 6.5",
        horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
        estadoPlace: "Abierto",
        rakingPlace: 5.0),
    PlaceModel(
        id: 2,
        imagePlace: "4.jpg",
        nombrePlace: "Don Pepe",
        direPlace: "Pilar Nores de García",
        horarioPlace: "Lunes a domingo, 9:00am - 6:00pm",
        estadoPlace: "Cerrado",
        rakingPlace: 5.0),
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
            itemCount: placesTop.length,
            itemBuilder: (context, index) {
              return YourWidget(place: placesTop[index]);
            }));
  }
}
