import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/widgets/cardPlaces.dart';

class TopCate extends StatefulWidget {
  TopCate({Key? key}) : super(key: key);

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
      horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
      estadoPlace: "Abierto",
      rakingPlace: 5.0,
    ),
    PlaceModel(
      id: 2,
      imagePlace: "4.jpg",
      nombrePlace: "Don Pepe",
      direPlace: "Pilar Nores de García",
      horarioPlace: "Lunes a domingo, 9:00am - 6:00pm",
      estadoPlace: "Cerrado",
      rakingPlace: 5.0,
    ),
    PlaceModel(
      id: 3,
      imagePlace: "5.jpg",
      nombrePlace: "King Kong",
      direPlace: "Carretera Zungarococha km 8.8",
      horarioPlace: "Lunes a domingo, 8:00am - 6:00pm",
      estadoPlace: "Abierto",
      rakingPlace: 5.0,
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
              place: TopCate.placesTop[
                  index]); // Accede a placesTop utilizando el nombre de la clase
        },
      ),
    );
  }
}
