import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';

Widget buildPlaceCard(BuildContext context, PlaceModel place) {
  return Card(
    margin: EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del lugar con bordes redondeados
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/images/${place.imagePlace}',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.0), // Espacio entre la imagen y el texto
          // Contenido del lugar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del lugar y ranking
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place.nombrePlace,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text('${place.rakingPlace}'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                // Dirección con icono
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 16.0),
                    SizedBox(width: 5.0),
                    Text(
                      place.direPlace,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                // Horario de atención con icono
                Row(
                  children: [
                    Icon(Icons.access_time,
                        color: Color(0xFF238F8F), size: 16.0),
                    SizedBox(width: 5.0),
                    Text(
                      '${place.horarioPlace}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite, color: Colors.redAccent),
                  ],
                ),
                // Estado centrado
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${place.estadoPlace}',
                        style:
                            TextStyle(color: Color(0xFF33EC05), fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
