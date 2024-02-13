import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/instalaciones_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';

import '../categorias/subcat/subCat1.dart';

class ViewCardUser extends StatefulWidget {
  final PlaceModel placeView;
  final ModelUser userView;
  ViewCardUser({Key? key, required this.placeView, required this.userView})
      : super(key: key);

  @override
  State<ViewCardUser> createState() => _ViewCardUserState();
}

class _ViewCardUserState extends State<ViewCardUser> {
  //1.1. Declaramos las instalaciones del luegar
  /* List<InstaModel> placesInsta = [
    InstaModel(
      instPlace: ["Zoológico", "Playa"],
    ),
  ]; */

  /* final categoryList = [
    "Cancha deportiva",
    "Parqueo",
    "Piscina",
    "Playa",
    "Restaurante",
    "Zona de juegos",
    "Zoológico"
  ]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/${widget.placeView.imagePlace}',
                  width: MediaQuery.of(context).size.width,
                  //height: 100.0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BottomNavUser(
                              user: widget.userView,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            //1. Card description
            Card(
              margin: EdgeInsets.all(15),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1. Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.placeView.nombrePlace}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text('${widget.placeView.rakingPlace}'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    //1. Lugar horario
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.red, size: 16.0),
                            Text(
                              '${widget.placeView.direPlace}',
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ],
                        ),
                        SizedBox(width: 90.0),
                        Row(
                          children: [
                            Text(
                              //Realizamos una condicional para hacer el cambio de estado
                              '${widget.placeView.estadoPlace}',
                              style: TextStyle(
                                color: widget.placeView.estadoPlace == "Abierto"
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //Distrito
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('${widget.placeView.distritoPlace}')],
                    ),
                    //Precios
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Precio',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF238F8F)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Color(0xFF238F8F), size: 16.0),
                                SizedBox(width: 5.0),
                                Text(
                                  '${widget.placeView.horarioPlace}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Niño - S/. ${widget.placeView.nino_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Adulto - S/. ${widget.placeView.adulto_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Turistas - S/. ${widget.placeView.turista_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Feriados - S/. ${widget.placeView.feriado_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone_android,
                                color: Color(0xFF238F8F), size: 16.0),
                            SizedBox(width: 5.0),
                            Text(
                              '${widget.placeView.phonePlace}',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Descripción
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descripción',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF238F8F)),
                        ),
                        Text("${widget.placeView.descriptionPlace}",
                            textAlign: TextAlign.justify),

                        SizedBox(
                          height: 10,
                        ),
                        //Palabras claves
                        Row(
                          children: [
                            Text(
                              "Palabras claves: ",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${widget.placeView.palabrasClavesP.join(', ')}",
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 171, 173, 173)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //2. Card 2
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: DefaultTabController(
                  length: widget.placeView.catePlace.length,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            color: Color(0xFF238F8F),
                            borderRadius: BorderRadius.circular(
                                24.0), // Puedes cambiar el color del círculo resaltado
                          ),
                          isScrollable: true,
                          tabs: (widget.placeView.catePlace.keys.toList())
                              .map((category) {
                            return Tab(
                              text: category,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100, // Tamaño fijo para el TabBarView
                        child: TabBarView(
                          children: (widget.placeView.catePlace.keys.toList())
                              .map((category) {
                            return _buildCategoryContent(category);
                          }).toList(),
                        ),
                      ),

                      /*  Expanded(
                        child: TabBarView(
                          children: categoryList.map((category) {
                            return _buildCategoryContent(category);
                          }).toList(),
                        ),
                      ), */
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //1.1. Función de la categoría
  Widget _buildCategoryContent(category) {
    // Aquí puedes personalizar el contenido según la categoría seleccionada
    switch (category) {
      case "Cancha deportiva":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Cancha deportiva'] != null)
                  for (final image in jsonDecode(
                      widget.placeView.catePlace['Cancha deportiva']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Lugar":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Lugar'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Lugar']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Parqueo":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Parqueo'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Parqueo']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Piscina":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Piscina'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Piscina']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Playa":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Playa'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Playa']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Restaurante":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Restaurante'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Restaurante']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));
      case "Zoológico":
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.placeView.catePlace['Zoológico'] != null)
                  for (final image
                      in jsonDecode(widget.placeView.catePlace['Zoológico']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 130,
                          height: 140,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/images/$image'),
                          ),
                        ),
                      ),
                    ),
              ],
            ));

      default:
        return Container(); // Por defecto, un contenedor vacío
    }
  }
}
