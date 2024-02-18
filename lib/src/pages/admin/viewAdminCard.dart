import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cadEdRegister.dart';

class ViewCardAdmin extends StatefulWidget {
  final PlaceModel placeViewA;
  final EmpresaModel userViewA;
  ViewCardAdmin({Key? key, required this.userViewA, required this.placeViewA})
      : super(key: key);

  @override
  State<ViewCardAdmin> createState() => _ViewCardAdminState();
}

class _ViewCardAdminState extends State<ViewCardAdmin> {
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
                  'assets/images/${widget.placeViewA.imagePlace}',
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BottomNavAdmin(
                              user: widget.userViewA,
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
                          '${widget.placeViewA.nombrePlace}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Editar",
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Aquí puedes agregar la lógica para editar
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardEdRegister(
                                      userCardEd: widget.userViewA,
                                      placeViewEd: widget.placeViewA,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                              '${widget.placeViewA.direPlace}',
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ],
                        ),
                        SizedBox(width: 90.0),
                        Row(
                          children: [
                            Text(
                              //Realizamos una condicional para hacer el cambio de estado
                              '${widget.placeViewA.estadoPlace}',
                              style: TextStyle(
                                color:
                                    widget.placeViewA.estadoPlace == "Abierto"
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
                      children: [Text('${widget.placeViewA.distritoPlace}')],
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
                                  '${widget.placeViewA.horarioPlace}',
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
                              "Niño - S/. ${widget.placeViewA.nino_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Adulto - S/. ${widget.placeViewA.adulto_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Turistas - S/. ${widget.placeViewA.turista_price}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Feriados - S/. ${widget.placeViewA.feriado_price}",
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
                              '${widget.placeViewA.phonePlace}',
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
                        Text("${widget.placeViewA.descriptionPlace}",
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
                              "${widget.placeViewA.palabrasClavesP.join(', ')}",
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
                  length: widget.placeViewA.catePlace.length,
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
                          tabs: (widget.placeViewA.catePlace.keys.toList())
                              .map((category) {
                            return Tab(
                              text: category,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 100, // Tamaño fijo para el TabBarView
                        child: TabBarView(
                          children: (widget.placeViewA.catePlace.keys.toList())
                              .map((category) {
                            return _buildCategoryContent(category);
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Editar",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Aquí puedes agregar la lógica para editar
                              /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewCardAdmin(
                                      placeViewA: place,
                                      userViewA: widget.userC,
                                    ),
                                  ),
                                ); */
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                if (widget.placeViewA.catePlace['Cancha deportiva'] != null)
                  for (final image in jsonDecode(
                      widget.placeViewA.catePlace['Cancha deportiva']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Lugar'] != null)
                  for (final image
                      in jsonDecode(widget.placeViewA.catePlace['Lugar']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Parqueo'] != null)
                  for (final image
                      in jsonDecode(widget.placeViewA.catePlace['Parqueo']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Piscina'] != null)
                  for (final image
                      in jsonDecode(widget.placeViewA.catePlace['Piscina']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Playa'] != null)
                  for (final image
                      in jsonDecode(widget.placeViewA.catePlace['Playa']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Restaurante'] != null)
                  for (final image in jsonDecode(
                      widget.placeViewA.catePlace['Restaurante']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
                if (widget.placeViewA.catePlace['Zoológico'] != null)
                  for (final image
                      in jsonDecode(widget.placeViewA.catePlace['Zoológico']!))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: 160,
                          height: 160,
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
