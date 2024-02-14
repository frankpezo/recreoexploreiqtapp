import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardRegister.dart';

class CardInsta extends StatefulWidget {
  final EmpresaModel userI;
  CardInsta({Key? key, required this.userI}) : super(key: key);

  @override
  State<CardInsta> createState() => _CardInstaState();
}

class _CardInstaState extends State<CardInsta> {
  bool _canchaDeportivaChecked = false;
  bool _lugarChecked = false;
  bool _parqueoChecked = false;
  bool _piscinaChecked = false;
  bool _playaChecked = false;
  bool _restauranteChecked = false;
  bool _zonaJuegosChecked = false;
  bool _zooChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            //key: formKeySix, // Asignar la nueva GlobalKey al Form
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            right:
                                20, // Ajusta el padding aquí para alinear la flecha con el borde derecho
                            left:
                                20, // Añade un padding izquierdo para alinear la flecha con el borde izquierdo
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardRegister(
                                    userCard: widget.userI,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 24,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Regresar',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 8,
                                right:
                                    20, // Ajusta el padding aquí para alinear la flecha con el borde derecho
                                left:
                                    20, // Añade un padding izquierdo para alinear la flecha con el borde izquierdo
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavAdmin(
                                    user: widget.userCard,
                                  ),
                                ),
                              ); */
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Omitir',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.all(15),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 40,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Instalaciones",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF238F8F)))
                                  ],
                                ),
                                SizedBox(height: 15),
                                CheckboxListTile(
                                  title: Text('Cancha deportiva'),
                                  value: _canchaDeportivaChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _canchaDeportivaChecked = value!;
                                      print(_canchaDeportivaChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors
                                      .white, // Color de la marca de verificación (aspa)
                                ),
                                CheckboxListTile(
                                  title: Text('Lugar'),
                                  value: _lugarChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _lugarChecked = value!;
                                      print(_lugarChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Parqueo'),
                                  value: _parqueoChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _parqueoChecked = value!;
                                      print(_parqueoChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Piscina'),
                                  value: _piscinaChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _piscinaChecked = value!;
                                      print(_piscinaChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Playa'),
                                  value: _playaChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _playaChecked = value!;
                                      print(_playaChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Restaurante'),
                                  value: _restauranteChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _restauranteChecked = value!;
                                      print(_restauranteChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Zona de juegos'),
                                  value: _zonaJuegosChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _zonaJuegosChecked = value!;
                                      print(_zonaJuegosChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                CheckboxListTile(
                                  title: Text('Zoológico'),
                                  value: _zooChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _zooChecked = value!;
                                      print(_zooChecked);
                                    });
                                  },
                                  activeColor: Color(
                                      0xFF238F8F), // Color de fondo del checkbox
                                  checkColor: Colors.white,
                                ),
                                SizedBox(
                                    height:
                                        20), // Espacio adicional para separar del botón
                                GestureDetector(
                                  onTap: () {
                                    // Aquí puedes usar las variables para saber qué opciones han sido seleccionadas
                                    // Luego puedes guardar estos valores como desees.
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    width: 325, // Ancho original del botón
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF238F8F),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Guardar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
