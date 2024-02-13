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
  TextEditingController comentarioU = TextEditingController();
  double fontSize = 11.0; // Definir la variable fontSize aquí
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
            //Card comentario y puntuación
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Card Comentarios
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comentarios',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF238F8F)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/profile.jpg'), // Ruta de la imagen del usuario
                                radius: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Nombre de usuario y Email
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Josefa Torres', //Datos dinámicos
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'El lugar está bonito', //Datos dinámicos
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text('3.0'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Card puntuación
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              'Puntuar',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF238F8F)),
                            ),
                            SizedBox(
                                width:
                                    10), // Espacio entre el texto y la lista desplegable
                            DropdownButton<int>(
                              value: 1, // Valor predeterminado
                              items: [
                                DropdownMenuItem<int>(
                                  value: 1,
                                  child: Text('1'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 2,
                                  child: Text('2'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 3,
                                  child: Text('3'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 4,
                                  child: Text('4'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 5,
                                  child: Text('5'),
                                ),
                              ],
                              onChanged: (int? value) {
                                // Aquí puedes manejar el cambio de valor
                                print('Seleccionaste: $value');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Comentario
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 100,
                          height: 30,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          child: TextFormField(
                            controller: comentarioU,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            onChanged: (text) {
                              // Verifica si el texto ingresado tiene al menos un carácter
                              if (text.isNotEmpty) {
                                // Cambia el tamaño de la letra
                                setState(() {
                                  // Puedes ajustar el tamaño de la letra según lo necesites
                                  // Por ejemplo, aquí se establece un tamaño de fuente más pequeño
                                  fontSize = 9.0;
                                });
                              } else {
                                setState(() {
                                  // Si el campo está vacío, restaura el tamaño de la letra original
                                  fontSize = 9.0;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Comentar...',
                              // Utiliza la variable fontSize para establecer el tamaño de la letra
                              hintStyle: TextStyle(
                                  color: Colors.grey[500], fontSize: fontSize),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            /* setState(() {
                                      if (formKey.currentState!.validate()) {}
                                    });
                                    getDatos(); */
                            //. Mensaje de éxito en caso se subió
                            //
                            print("Subido");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor:
                                  Color.fromARGB(255, 36, 246, 116),
                              content: Text(
                                'Se subió con éxito',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              duration: Duration(seconds: 5),
                            ));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 10, top: 20),
                            width: 100, // Ancho original del botón
                            height: 25,
                            padding: const EdgeInsets.only(top: 3, left: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF238F8F),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Subir',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
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
