import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';

class ViewCardUser extends StatefulWidget {
  ViewCardUser({Key? key}) : super(key: key);

  @override
  State<ViewCardUser> createState() => _ViewCardUserState();
}

class _ViewCardUserState extends State<ViewCardUser> {
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
                  'assets/images/quis.jpg',
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
                      /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavUser(
                            user: null,
                          ),
                        ),
                      ); */
                    },
                  ),
                ),
              ],
            ),
            //1. Card description
            Card(
              margin: EdgeInsets.all(16.0),
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
                          'Quistococha',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text('4.5'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    //1. Lugar horario
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red, size: 16.0),
                        SizedBox(width: 5.0),
                        Text(
                          'Carretera Iquitos - Nauta, km 6.5',
                          style: TextStyle(fontSize: 13.0),
                        ),
                        SizedBox(width: 90.0),
                        Text(
                          //Realizamos una condicional para hacer el cambio de estado
                          'Abierto',
                          style: TextStyle(
                            color: 'Abierto' == "Abierto"
                                ? Colors.green
                                : Color.fromARGB(255, 111, 54, 50),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    //Distrito
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('San Juan')],
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
                                  'Lunes a domingo, 7:30am - 5:30pm',
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
                              "Niño - S/. 5",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Adulto - S/. 10",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Turistas - S/. 15",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "Feriados - S/. 5",
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
                              '999999999',
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
                        Text(
                            "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
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
                              "Playa, animales, zoológico",
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
          ],
        ),
      ),
    );
  }
}
